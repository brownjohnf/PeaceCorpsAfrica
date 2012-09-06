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

    it 'should respond to initiatives' do
      @page.should respond_to :initiatives
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

    describe 'initiatives' do
      before :each do
        @initiative = FactoryGirl.create(:initiative, :page => @page = FactoryGirl.create(:page))
      end

      it 'should return the correct initiatives' do
        @page.initiatives.should eq [@initiative]
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

    pending 'should reject excessively long html'
  end

  describe 'locked_ats' do
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
