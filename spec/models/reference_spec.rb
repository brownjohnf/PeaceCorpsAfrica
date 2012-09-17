require 'spec_helper'

describe Reference do
  before :each do
    @attr = {
      :link_text => 'test text',
      :link_target_id => 1,
      :link_target_type => 'Page',
      :link_source_id => 1,
      :link_source_type => 'Page'
    }
  end

  it 'should create a valid instance given valid attributes' do
    Reference.new(@attr).should be_valid
  end

  describe 'properties' do
    before :each do
      @reference = Reference.new(@attr)
    end

    it 'should respond to link_source_id' do
      @reference.should respond_to :link_source_id
    end

    it 'should respond to link_source_type' do
      @reference.should respond_to :link_source_type
    end

    it 'should respond to link_target_id' do
      @reference.should respond_to :link_target_id
    end

    it 'should respond to link_target_type' do
      @reference.should respond_to :link_target_type
    end

    it 'should respond to link_text' do
      @reference.should respond_to :link_text
    end

    describe 'link_text' do
      it 'should be blank by default' do
        Reference.new.link_text.should be_blank
      end
    end
  end

  describe 'validations' do
    describe 'link_source_id' do
      it 'should require a link_source_id' do
        Reference.new(@attr.merge(:link_source_id => '')).should_not be_valid
      end
    end

    describe 'link_source_id' do
      it 'should require a link_source_id' do
        Reference.new(@attr.merge(:link_source_id => '')).should_not be_valid
      end
    end

    describe 'link_target_id' do
      it 'should not require a link_target_id' do
        Reference.new(@attr.merge(:link_target_id => '')).should be_valid
      end
    end

    describe 'link_target_type' do
      it 'should not require a link_target_type' do
        Reference.new(@attr.merge(:link_target_type => '')).should be_valid
      end
    end

    describe 'link_text' do
      it 'should require link_text' do
        Reference.new(@attr.merge(:link_text => '')).should_not be_valid
      end

      it 'should not allow link_text longer than 255 chars' do
        Reference.new(@attr.merge(:link_text => 'a'*256)).should_not be_valid
      end
    end

    describe 'each target/source/text combo should be unique' do
      it 'should not allow duplicate entries' do
        Reference.create! @attr
        Reference.create(@attr).should_not be_valid
      end
    end
  end

  describe 'scopes' do
    it 'should respond to pages' do
      Reference.should respond_to :to_pages
    end

    describe 'default' do
      before :each do
        @reference1 = Reference.create(@attr.merge(:link_text => 'Zzzzz link'))
        @reference2 = Reference.create(@attr.merge(:link_text => 'Aaaa link'))
      end

      it 'should sort by link_text' do
        Reference.all.should start_with @reference2
        Reference.all.should end_with @reference1
      end
    end

    describe 'to_pages' do
      before :each do
        FactoryGirl.create(:reference, :link_target => FactoryGirl.create(:page))
        FactoryGirl.create(:reference, :link_target => FactoryGirl.create(:user))
      end

      it 'should return only pages' do
        Reference.to_pages.each do |to_page|
          to_page.link_target_type.should eq 'Page'
        end
      end
    end
  end

  describe 'associations' do
    before :each do
      @reference = Reference.new @attr
    end

    it 'should respond to link_source' do
      @reference.should respond_to :link_source
    end

    it 'should respond to link_target' do
      @reference.should respond_to :link_target
    end

    describe 'link_source' do
      before :each do
        @reference = FactoryGirl.create(:reference, :link_source => @page = FactoryGirl.create(:page))
      end

      it 'should return the correct link_source' do
        @reference.link_source.should eq @page
      end

      it 'should be an instance of link_source_type' do
        @reference.link_source.should be_an_instance_of @reference.link_source_type.constantize
      end
    end

    describe 'link_target' do
      before :each do
        @reference = FactoryGirl.create(:reference, :link_target => @page = FactoryGirl.create(:page))
      end

      it 'should return the correct link_target' do
        @reference.link_target.should eq @page
      end

      it 'should be an instance of link_target_type' do
        @reference.link_target.should be_an_instance_of @reference.link_target_type.constantize
      end
    end
  end
  
  describe 'methods' do
    describe 'process_string' do
      it 'should ignore markdown links' do
        Reference.process_string('this is text containing [a markdown link](http://test.com)', Page, 1).should =~ /\[a markdown link\]\(http:\/\/test\.com\)/
      end

      describe 'external' do
        it 'should find and replace external pca links' do
          Reference.process_string('this is text containing [[http://an.external.link]]', Page, 1).should =~ /<a href="http:\/\/an\.external\.link">http:\/\/an\.external\.link<\/a>/
        end
      end

      describe 'unscoped' do
        it 'should find and replace non-scoped pca links' do
          Reference.process_string('this is text containing [[a pca link]]', Page, 1).should =~ />a pca link.*<\/a>/
        end

        it 'should create link entries in references' do
          expect {
            Reference.process_string('a [[test link]] should work', Page, 1)
          }.to change(Reference, :count).by(1)
        end
      end

      describe 'scoped' do
        it 'should find and replace scoped pca links' do
          Reference.process_string('this is text containing [blarg[a pca link]]', Page, 1).should =~ />a pca link.*<\/a>/
        end

        context 'page-scoped' do
          describe 'with one matching page' do
            before :each do
              @page = FactoryGirl.create :page
            end

            it 'should be case-insensitive' do
              Reference.process_string("this is text containing [page[#{@page.title.downcase}]] for testing.", Page, 1).should =~ /"\/pages\/#{@page.to_param}"/i
            end

            it 'should set the correct path to the page' do
              Reference.process_string("this is text containing [page[#{@page.title}]] for testing.", Page, 1).should =~ /"\/pages\/#{@page.to_param}"/i
            end

            it 'should change the Reference count' do
              expect {
                Reference.process_string("this is text containing [page[#{@page.title}]] for testing.", Page, 1)
              }.to change(Reference, :count).by(1)
            end
          end

          describe 'with multiple matching pages' do
            before :each do
              @page = FactoryGirl.create(:page, :title => 'Fancy Title')
              @page2 = FactoryGirl.create(:page, :title => 'Fancy Title')
              expect {
                @result = Reference.process_string("this is text containing [page[fancy title]] for testing.", Page, 1)
              }.to change(Reference, :count).by(1)
            end

            pending 'should set the path to disambiguation' do
              @result.should =~ /"\/pages\/#{@page.to_param}"/i
            end

            it 'should append disambiguation icon to link text' do
              @result.should =~ /<span class="icon-random"><\/span><\/a>/i
            end

            it 'should add disambiguation class' do
              @result.should =~ /class="disambiguation"/i
            end
          end

          describe 'with no matching pages' do
            before :each do
              expect {
                @result = Reference.process_string('new [page[link text such an absurd then]]', Page, 1)
              }.to change(Reference, :count).by(1)
            end

            pending 'should set the path to missing' do
              @result.should =~ /"\/pages\/#{@page.to_param}"/i
            end

            it 'should append missing icon to link text' do
              @result.should =~ /<span class="icon-remove-circle"><\/span><\/a>/i
            end

            it 'should add missing class' do
              @result.should =~ /class="missing"/i
            end
          end
        end

        context 'user-scoped' do
          describe 'with one matching user' do
            before :each do
              @user = FactoryGirl.create :user
            end

            it 'should set the correct path to the user' do
              Reference.process_string("this is text containing [user[#{@user.name}]] for testing.", Page, 1).should =~ /"\/users\/#{@user.to_param}"/i
            end

            it 'should be case-insensitive' do
              Reference.process_string("this is text containing [user[#{@user.name.downcase}]] for testing.", Page, 1).should =~ /"\/users\/#{@user.to_param}"/i
            end

            it 'should change the Reference count' do
              expect {
                Reference.process_string("this is text containing [user[#{@user.name}]] for testing.", Page, 1)
              }.to change(Reference, :count).by(1)
            end
          end
        end
      end
    end
  end
end
