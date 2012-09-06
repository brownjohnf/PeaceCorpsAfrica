require 'spec_helper'

describe Initiative do
  before :each do
    @attr = {
      :name => 'Food Security',
      :abbreviation => 'FOODSEC',
      :start_date => '1961-01-02',
      :page_id => 1
    }
  end
  
  it 'should create a new instance given valid attributes' do
    Initiative.create! @attr
  end

  describe 'properties' do
    before :each do
      @initiative = Initiative.new @attr
    end

    it 'should respond to abbreviation' do
      @initiative.should respond_to :abbreviation
    end

    it 'should respond to contact_email' do
      @initiative.should respond_to :contact_email
    end

    it 'should respond to donate_url' do
      @initiative.should respond_to :donate_url
    end

    it 'should respond to name' do
      @initiative.should respond_to :name
    end

    it 'should respond to page_id' do
      @initiative.should respond_to :page_id
    end

    it 'should respond to site_url' do
      @initiative.should respond_to :site_url
    end

    it 'should respond to start_date' do
      @initiative.should respond_to :start_date
    end
  end

  describe 'methods' do
    describe 'initiative_url_fors' do
      it 'should respond to initiative_url_for(initiative)' do
        Initiative.new.should respond_to(:initiative_url_for).with(1).argument
      end
      
      describe 'given a country_initiative without an initiative_url' do
        before :each do
          @ci = FactoryGirl.create :country_initiative
          @country = @ci.country
          @initiative = @ci.initiative
        end

        it 'should be blank' do
          @initiative.initiative_url_for(@country).should be_blank
        end
      end

      describe 'given a country_initiative with a valid initiative_url_for' do
        before :each do
          @ci = FactoryGirl.create :country_initiative, :initiative_url => 'http://www.example.com'
          @country = @ci.country
          @initiative = @ci.initiative
        end

        it 'should not be blank' do
          @initiative.initiative_url_for(@country).should_not be_blank
        end
        
        it 'should return the correct country_url' do
          @initiative.initiative_url_for(@country).should eq @ci.initiative_url
        end
      end
    end
  end

  describe 'associations' do
    before :each do
      @initiative = Initiative.new @attr
    end

    it 'should respond to page' do
      @initiative.should respond_to :page
    end

    it 'should respond country_initiatives' do
      @initiative.should respond_to :country_initiatives
    end

    it 'should respond to countries' do
      @initiative.should respond_to :countries
    end

    describe 'country_initiatives' do
      before :each do
        @ci = FactoryGirl.create :country_initiative
        @initiative = @ci.initiative
      end

      it 'should return the correct country_initiatives' do
        @initiative.country_initiatives.should eq [@ci]
      end
    end

    describe 'countries' do
      before :each do
        ci = FactoryGirl.create :country_initiative
        @country = ci.country
        @initiative = ci.initiative
      end

      it 'should return the correct initiatives' do
        @initiative.countries.should eq [@country]
      end
    end

    describe 'page' do
      before :each do
        @initiative = FactoryGirl.create(:initiative, :page => @page = FactoryGirl.create(:page))
      end

      it 'should return the correct page' do
        @initiative.page.should eq @page
      end
    end
  end
    
  describe 'abbreviations' do
    it 'should require an abbreviation' do
      Initiative.new(@attr.merge(:abbreviation => '')).should_not be_valid
    end

    it 'should reject duplicate abbreviations' do
      Initiative.create! @attr
      Initiative.new(@attr.merge(:name => 'stomp')).should_not be_valid
    end

    it 'should reject abbreviations longer than 7' do
      long = 'a'*8
      Initiative.new(@attr.merge(:abbreviation => long)).should_not be_valid
    end

    it 'should reject abbreviations shorter than 3' do
      short = 'a'*2
      Initiative.new(@attr.merge(:abbreviation => short)).should_not be_valid
    end

    it 'should be stored as upcase in database' do
      initiative = Initiative.new @attr.merge(:abbreviation => 'foodsec')
      initiative.save
      initiative.abbreviation.should == 'FOODSEC'
    end

    it 'should reject non-alphanumeric characters' do
      [' foodsec', 'foodsec ', 'food sec', 'food-sec', 'food_sec', 'foodsec1', 'food1sec', '1foodsec','1234'].each do |bad_abb|
        Initiative.new(@attr.merge(:abbreviation => bad_abb)).should_not be_valid
      end
    end
  end

  describe 'contact_emails' do
    it 'should reject contact_emails longer than 255 chars' do
      long = 'a'*256
      Initiative.new(@attr.merge(:contact_email => long)).should_not be_valid
    end

    it 'should accept valid contact_emails' do
      ['user@example.com','user_user@example.com','user-user@example.com','232@example.com', 'user@234.com', 'user@example-2.com', '_user@example.com', '-user@example.com'].each do |good_email|
        Initiative.new(@attr.merge(:contact_email => good_email)).should be_valid
      end
    end

    it 'should reject non-valid contact_emails' do
      ['userexample.com','user@example','userexample','user 2@example.com'].each do |bad_email|
        Initiative.new(@attr.merge(:contact_email => bad_email)).should_not be_valid
      end
    end
  end

  describe 'donate_urls' do
    it 'should reject donate_urls longer than 255 chars' do
      long = 'a'*256
      Initiative.new(@attr.merge(:name => '')).should_not be_valid
    end

    it 'should allow valid hyperlinks' do
      ['http://www.example.com', 'https://www.example.com', 'http://example.com', 'http://example.com/test.html', 'http://example.com/test', 'http://example.com/?q=test', 'http://example.com?q=test', 'http://example.com/test/?q=test'].each do |good_url|
        Initiative.new(@attr.merge(:donate_url => good_url)).should be_valid
      end
    end

    it 'should reject non-valid hyperlinks' do
      ['www.example.com', 'example.com', 'http/www.example.com', 'http:/www.example.com', 'this is not a link', 'http://www.example.com/this is invalid'].each do |bad_url|
        Initiative.new(@attr.merge(:donate_url => bad_url)).should_not be_valid
      end
    end
  end

  describe 'names' do
    it 'should require a name' do
      Initiative.new(@attr.merge(:name => '')).should_not be_valid
    end

    it 'should reject duplicate names' do
      Initiative.create! @attr
      Initiative.new(@attr.merge(:abbreviation => 'stomp')).should_not be_valid
    end

    it 'should reject names longer than 255' do
      long = 'a'*256
      Initiative.new(@attr.merge(:name => long)).should_not be_valid
    end
  end

  describe 'page_ids' do
    it 'should require a page_id' do
      Initiative.new(@attr.merge(:page_id => '')).should_not be_valid
    end

    it 'should reject non-numeric ids' do
      Initiative.new(@attr.merge(:page_id => 'a')).should_not be_valid
    end
  end

  describe 'site_urls' do
    it 'should reject site_urls longer than 255 chars' do
      long = 'a'*256
      Initiative.new(@attr.merge(:site_url => long)).should_not be_valid
    end

    it 'should allow valid hyperlinks' do
      ['http://www.example.com', 'https://www.example.com', 'http://example.com', 'http://example.com/test.html', 'http://example.com/test', 'http://example.com/?q=test', 'http://example.com?q=test', 'http://example.com/test/?q=test'].each do |good_url|
        Initiative.new(@attr.merge(:site_url => good_url)).should be_valid
      end
    end

    it 'should reject non-valid hyperlinks' do
      ['www.example.com', 'example.com', 'http/www.example.com', 'http:/www.example.com', 'this is not a link', 'http://www.example.com/this is invalid'].each do |bad_url|
        Initiative.new(@attr.merge(:site_url => bad_url)).should_not be_valid
      end
    end
  end

  describe 'start_dates' do
    it 'should require a start_date' do
      initiative = Initiative.new @attr.merge(:start_date => '')
      initiative.should_not be_valid
    end

    it 'should reject invalid dates' do
      initiative = Initiative.new @attr.merge(:start_date => '1963-24-21')
      initiative.should_not be_valid
    end

    it 'should reject dates earlier than 1961-01-01' do
      initiative = Initiative.new @attr.merge(:start_date => '1960-12-31')
      initiative.should_not be_valid
    end

    it 'should reject dates in the future' do
      initiative = Initiative.new @attr.merge(:start_date => Date.tomorrow.strftime('%Y-%m-%d'))
      initiative.should_not be_valid
    end
  end

end
