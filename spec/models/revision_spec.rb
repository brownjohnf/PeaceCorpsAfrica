require 'spec_helper'

describe Revision do
  before :each do
    @attr = {
      :author_id => 1,
      :page_id => 1,
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

    it 'should respond to page_id' do
      @revision.should respond_to :page_id
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
  end
end
