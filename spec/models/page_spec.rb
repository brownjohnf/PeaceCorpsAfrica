require 'spec_helper'

describe Page do
  before :each do
    @attr = {
      :title => 'Test Page',
      :country_id => 1
    }
  end

  it 'should create a valid instance given valid attrs' do
    Page.create! @attr
  end

  describe 'properties' do
    before :each do
      @page = Page.new @attr
    end
    
    it 'should respond to country_id' do
      @page.should respond_to(:country_id)
    end
    
    it 'should respond to html' do
      @page.should respond_to(:html)
    end
    
    it 'should respond to locked_at' do
      @page.should respond_to(:locked_at)
    end
    
    it 'should respond to locked_by' do
      @page.should respond_to(:locked_by)
    end
    
    it 'should respond to title' do
      @page.should respond_to(:title)
    end
  end

  describe 'associations' do
    before :each do
      @page = FactoryGirl.create(:page)
    end

    it 'should respond to country' do
      @page.should respond_to :country
    end

    it 'should respond to countries' do
      @page.should respond_to :countries
    end

    it 'should respond to current_revision' do
      Page.new(@attr).should respond_to :current_revision
    end

    it 'should respond to editor' do
      @page.should respond_to :editor
    end

    it 'should respond to initiatives' do
      @page.should respond_to :initiatives
    end

    it 'should respond to revisions' do
      Page.new(@attr).should respond_to :revisions
    end

    describe 'country' do
      before :each do
        @page = FactoryGirl.create(:page, :country => @country = FactoryGirl.create(:country))
      end

      it 'should return the correct country' do
        @page.country.should eq @country
      end
    end

    describe 'countries' do
      before :each do
        @country = FactoryGirl.create(:country, :page => @page = FactoryGirl.create(:page))
      end

      it 'should return the correct countries' do
        @page.countries.should eq [@country]
      end
    end

    describe 'current_revision' do
      before :each do
        @revision = FactoryGirl.create(:revision, :page => @page = FactoryGirl.create(:page))
        @revision2 = FactoryGirl.create(:revision, :page => @page, :content => 'changed content')
      end

      it 'should be an instance of Revision' do
        @page.current_revision.should be_an_instance_of Revision
      end

      it 'should return the correct revision' do
        @page.current_revision.should eq @revision2
      end
    end

    describe 'editor' do
      before :each do
        @page = FactoryGirl.create :page
        @user = FactoryGirl.create :user
      end

      it 'should have no editor by default' do
        @page.editor.should be_nil
      end

      it 'should have an editor after locking' do
        @page.lock(@user).editor.should be @user
      end

      it 'should have an editor after unlocking' do
        @page.lock(@user)
        @page.unlock.editor.should be @user
      end
    end

    describe 'initiatives' do
      before :each do
        @initiative = FactoryGirl.create(:initiative, :page => @page = FactoryGirl.create(:page))
      end

      it 'should be an instance of Initiative' do
        @page.initiatives.first.should be_an_instance_of Initiative
      end

      it 'should return the correct initiatives' do
        @page.initiatives.should eq [@initiative]
      end
    end

    describe 'revisions' do
      before :each do
        @page = Page.create!(:title => 'test', :country_id => 1)
        @page.update_attributes(:revisions_attributes => [{:content => 'testing', :author_id => 1}])
        @revision = @page.revisions.first
      end

      it 'should be an instance of Revision' do
        @page.revisions.first.should be_an_instance_of Revision
      end

      it 'should return the correct revision' do
        @page.revisions.should eq [@revision]
      end

      it 'should accept nested attributes' do
        lambda do
          @page.update_attributes!(:revisions_attributes => [{:content => 'test', :author_id => 1}])
        end.should change(Revision, :count).by(1)
      end

      it 'should reject if content is blank' do
        lambda do
          @page.update_attributes!(:revisions_attributes => [{:content => '', :author_id => 1}])
        end.should_not change(Revision, :count).by(1)
      end

      it 'should destroy revisions on destroy' do
        lambda do
          @page.destroy
        end.should change(Revision, :count).by(-1)
      end
    end
  end

  describe 'methods' do
    it 'should respond to lock(user)' do
      Page.new(@attr).should respond_to(:lock).with(1).argument
    end

    it 'should respond to locked?' do
      Page.new(@attr).should respond_to :locked?
    end

    it 'should respond to unlock' do
      Page.new(@attr).should respond_to :unlock
    end

    it 'should respond to set_html(content)' do
      Page.new(@attr).should respond_to(:set_html).with(1).argument
    end

    describe 'lock(user)' do
      before :each do
        @page = FactoryGirl.create :page
        @user = FactoryGirl.create :user
      end

      it 'should set locked_at' do
        locked_at = @page.locked_at
        @page.lock(@user)
        @page.reload
        @page.locked_at.should_not be_blank
      end

      it 'should return itself' do
        @page.lock(@user).should be @page
      end

      it 'should update locked_at' do
        locked_at = @page.lock(@user).locked_at
        @page.lock(@user).locked_at.should be > locked_at
      end

      it 'should set locked_at to Time.now' do
        @time = Time.now - 1.second
        @page.lock(@user)
        @page.reload.locked_at.should be > @time
      end

      it 'should set locked_by' do
        locked_by = @page.locked_by
        @page.lock(@user).locked_by.should_not eq locked_by
      end

      it 'should update locked_by' do
        locked_by = @page.lock(@user).locked_by
        @page.lock(FactoryGirl.create(:user)).locked_by.should_not eq locked_by
      end
    end

    describe 'locked?' do
      before :each do
        @page = FactoryGirl.create :page
      end

      it 'should return false by default' do
        @page.locked?.should_not be_true
      end

      it 'should return true after locking' do
        @page.lock(FactoryGirl.create(:user)).locked?.should be_true
      end

      it 'should return false 15 min after locking' do
        @page.update_attribute(:locked_at, Time.now - 15.minutes - 1.second)
        @page.locked?.should_not be_true
      end

      it 'should return false after unlocking' do
        @page.lock(FactoryGirl.create(:user))
        @page.unlock.locked?.should_not be_true
      end
    end

    describe 'set_html(content)' do
      before :each do
        @page = FactoryGirl.create :page
      end

      it 'should change html' do
        new_html = @page.html + ' spiffy HTML'
        @page.set_html(new_html)
        @page.html.should eq new_html
      end
    end

    describe 'unlock' do
      before :each do
        @page = FactoryGirl.create :page
      end

      it 'should return itself' do
        @page.unlock.should be @page
      end

      it 'should clear locked_at' do
        @page.lock(@user)
        @page.unlock
        @page.reload.locked_at.should be_blank
      end

      it 'should not clear locked_by' do
        @page.lock(@user)
        @page.unlock.locked_at.should be_blank
      end
    end
  end

  describe 'country_ids' do
    it 'should require a country_id' do
      Page.new(@attr.merge(:country_id => '')).should_not be_valid
    end

    it 'should be an integer' do
      Page.new(@attr.merge(:country_id => 'a')).should_not be_valid
    end
  end

  describe 'htmls' do
    it 'should set default html' do
      page = Page.new @attr
      page.html.should =~ /no content/i
    end
  end

  describe 'locked_ats' do
    it 'should not be set by default' do
      Page.new(@attr).locked_at.should be_blank
    end

    it 'should be a datetime' do
      Page.new(@attr.merge(:locked_at => Time.now)).locked_at.should be_an_instance_of(ActiveSupport::TimeWithZone)
    end
  end

  describe 'locked_by' do
    it 'should be an integer' do
      Page.new(@attr.merge(:locked_by => 'a')).should_not be_valid
    end
  end

  describe 'titles' do
    it 'should require a title' do
      Page.new(@attr.merge(:title => '')).should_not be_valid
    end

    it 'should reject titles longer than 255 chars' do
      long_title = 'a'*256
      Page.new(@attr.merge(:title => long_title)).should_not be_valid
    end

    it 'should reject titles shorter than 3 chars' do
      short_title = 'a'*2
      Page.new(@attr.merge(:title => short_title)).should_not be_valid
    end
  end
end
