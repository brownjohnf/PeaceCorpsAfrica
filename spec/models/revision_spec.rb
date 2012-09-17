require 'spec_helper'

describe Revision do
  before :each do
    id = FactoryGirl.create(:page).id
    @attr = {
      :author_id => 1,
      :page_id => id,
      :content => 'Test Content'
    }
  end
  
  it 'should create a valid instance given valid attributes' do
    Revision.create! @attr
  end

  describe 'properties' do
    before :each do
      @revision = FactoryGirl.create :revision
    end

    it 'should respond to author_id' do
      @revision.should respond_to :author_id
    end

    it 'should respond to content' do
      @revision.should respond_to :content
    end

    it 'should respond to html' do
      @revision.should respond_to :html
    end

    it 'should respond to page_id' do
      @revision.should respond_to :page_id
    end

    describe 'html' do
      it 'should be blank by default' do
        Revision.new(@attr).html.should be_blank
      end

      it 'should be populated before save' do
        @revision = Revision.new(@attr)
        @revision.save!
        @revision.html.should_not be_blank
      end

      it 'should update html based on content' do
        @revision.update_attributes(:content => 'super cool content')
        @revision.html.should =~ /super cool content/i
      end
    end
  end

  describe 'validations' do
    describe 'author_ids' do
      it 'should require an author_id' do
        Revision.new(@attr.merge(:author_id => '')).should_not be_valid
      end

      it 'should be an integer' do
        Revision.new(@attr.merge(:author_id => 'a')).should_not be_valid
      end
    end

    describe 'content' do
      it 'should require content' do
        Revision.new(@attr.merge(:content => '')).should_not be_valid
      end

      context 'for a given page_id' do
        before :each do
          @revision = Revision.create @attr
        end

        it 'should be valid if content is NOT the same as most recent content for given page_id' do
          @revision2 = Revision.new @attr.merge(:content => 'new content!')
          @revision2.should be_valid
        end

        pending 'should not be valid if content is the same as most recent content for given page_id' do
          @revision2 = Revision.new @attr
          @revision2.should_not be_valid
        end
      end
    end

    describe 'html' do
      it 'should always validate' do
        Revision.new(@attr.merge(:html => '')).should be_valid
      end
    end

    describe 'page_id' do
      it 'should require an page_id' do
        Revision.new(@attr.merge(:page_id => '')).should_not be_valid
      end

      it 'should be an integer' do
        Revision.new(@attr.merge(:page_id => 'a')).should_not be_valid
      end
    end
  end

  describe 'scopes' do
    before :each do
      @revision1 = FactoryGirl.create :revision
      @revision2 = FactoryGirl.create :revision
    end

    describe 'default' do
      it 'should sort by time created, desc' do
        Revision.all.should eq [@revision2,@revision1]
      end
    end
  end

  describe 'associations' do
    before :each do
      @revision = FactoryGirl.create :revision
    end
    
    it 'should respond to page' do
      Revision.new(@attr).should respond_to :page
    end

    it 'should respond to author' do
      Revision.new(@attr).should respond_to :author
    end

    describe 'page' do
      before :each do
        @revision = FactoryGirl.create(:revision, :page => @page = FactoryGirl.create(:page))
      end

      it 'should be a Page' do
        @revision.page.should be_an_instance_of Page
      end

      it 'should load the correct page' do
        @revision.page.should be @page
      end

      it 'should update page.html after save' do
        @page = @revision.page
        old_html = Markdown.render(@page.html)
        new_html = Markdown.render('fun, new html!')
        FactoryGirl.create(:revision, :page => @page, :content => new_html)
        @page.reload
        @page.html.should_not eq old_html
        @page.html.should eq new_html
      end
    end

    describe 'author' do
      before :each do
        @revision = FactoryGirl.create(:revision, :author => @author = FactoryGirl.create(:author))
      end

      it 'should be a User' do
        @revision.author.should be_an_instance_of User
      end

      it 'should load the correct author' do
        @revision.author.should be @author
      end
    end
  end

  describe 'methods' do
    before :each do
      @revision1 = FactoryGirl.create(:revision, :page => @page = FactoryGirl.create(:page))
      FactoryGirl.create(:revision)
      @revision2 = FactoryGirl.create(:revision, :page => @page)
      FactoryGirl.create(:revision)
      @revision3 = FactoryGirl.create(:revision, :page => @page)
    end

    it 'should respond to next' do
      @revision2.should respond_to :next
    end

    it 'should respond to prev' do
      @revision2.should respond_to :prev
    end


    describe 'next' do
      it 'should return a revision' do
        @revision2.next.should be_an_instance_of Revision
      end

      it 'should return the correct revision' do
        @revision2.next.should eq @revision3
      end
    end

    describe 'prev' do
      it 'should return a revision' do
        @revision2.prev.should be_an_instance_of Revision
      end

      it 'should return the correct revision' do
        @revision2.prev.should eq @revision1
      end
    end
  end

  describe 'parsing pca links' do
    before :each do
      @revision = FactoryGirl.create :revision
    end

    it 'should ignore markdown links' do
      @revision.update_attributes(:content => 'this is text containing [a markdown link](http://test.com)')
      @revision.content.should =~ /\[a markdown link\]\(http:\/\/test\.com\)/
    end

    it 'should find and replace non-scoped pca links' do
      @revision.update_attributes(:content => 'this is text containing [[a pca link]]')
      @revision.html.should =~ />a pca link.*<\/a>/
    end

    it 'should find and replace scoped pca links' do
      @revision.update_attributes(:content => 'this is text containing [file[a pca link]]')
      @revision.html.should =~ />a pca link.*<\/a>/
    end

    it 'should find and replace external pca links' do
      @revision.update_attributes(:content => 'this is text containing [[http://an.external.link]]')
      @revision.html.should =~ /<a href="http:\/\/an\.external\.link">http:\/\/an\.external\.link<\/a>/
    end

    it 'should ignore markdown links' do
      @revision.update_attributes(:content => 'this is text containing [a markdown link](http://test.com)')
      @revision.content.should =~ /\[a markdown link\]\(http:\/\/test\.com\)/
    end

    describe 'page-scoped' do
      context 'with one matching page' do
        before :each do
          @page = FactoryGirl.create :page
          @revision.update_attributes(:content => "this is text containing [page[#{@page.title}]] for testing.")
        end

        it 'should set the correct path to the page' do
          @revision.html.should =~ /"\/pages\/#{@page.to_param}"/i
        end
      end

      context 'with multiple matching pages' do
        before :each do
          @page = FactoryGirl.create :page
          @revision.update_attributes(:content => "this is text containing [page[shiny title]] for testing.")
        end

        pending 'should set the path to disambiguation' do
          @revision.html.should =~ /"\/pages\/#{@page.to_param}"/i
        end

        it 'should append disambiguation icon to link text' do
          @revision.html.should =~ /<span class="icon-random"><\/span><\/a>/i
        end

        it 'should add disambiguation class' do
          @revision.html.should =~ /class="disambiguation"/i
        end
      end

      context 'with no matching pages' do
        before :each do
          @revision.update_attributes(:content => "this is text containing [page[no page would have this name, duh!]] for testing.")
        end

        pending 'should set the path to missing' do
          @revision.html.should =~ /"\/pages\/#{@page.to_param}"/i
        end

        it 'should append missing icon to link text' do
          @revision.html.should =~ /<span class="icon-remove-circle"><\/span><\/a>/i
        end

        it 'should add missing class' do
          @revision.html.should =~ /class="missing"/i
        end
      end
    end

    describe 'user-scoped' do
      context 'with a matching user' do
        before :each do
          @user = FactoryGirl.create :user
          @revision.update_attributes(:content => "this is text containing [user[#{@user.name}]] for testing.")
        end

        it 'should set the correct path to the user' do
          @revision.html.should =~ /"\/users\/#{@user.to_param}"/i
        end
      end
    end
  end
end
