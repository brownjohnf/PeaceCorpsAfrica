require 'spec_helper'

describe Country do
  before :each do
    @attr = {
      :code => 'SN',
      :start_date => '1961-01-02',
      :page_id => 1
    }
  end

  it 'should create a new instance given valid attributes' do
    Country.create! @attr
  end

  describe 'properties' do
    before :each do
      @country = Country.new @attr
    end

    it 'should respond to active' do
      @country.should respond_to(:active)
    end

    it 'should respond to code' do
      @country.should respond_to(:code)
    end

    it 'should respond to contact_email' do
      @country.should respond_to(:contact_email)
    end

    it 'should respond to donate_url' do
      @country.should respond_to(:donate_url)
    end

    it 'should respond to info_url' do
      @country.should respond_to :info_url
    end

    it 'should respond to name' do
      @country.should respond_to(:name)
    end

    it 'should respond to page_id' do
      @country.should respond_to(:page_id)
    end

    it 'should respond to site_url' do
      @country.should respond_to(:site_url)
    end

    it 'should respond to start_date' do
      @country.should respond_to(:start_date)
    end
  end

  describe 'methods' do
    describe 'country_url_fors' do
      it 'should respond to country_url_for(initiative)' do
        #@country.country_url(initiative).should be_valid
        Country.new.should respond_to(:country_url_for).with(1).argument
      end
      
      describe 'given a country_initiative without a country_url' do
        before :each do
          @ci = FactoryGirl.create :country_initiative
          @country = @ci.country
          @initiative = @ci.initiative
        end

        it 'should be blank' do
          @country.country_url_for(@initiative).should be_blank
        end
      end

      describe 'given a country_initiative with a country_url' do
        before :each do
          @ci = FactoryGirl.create :country_initiative, :country_url => 'http://www.example.com'
          @country = @ci.country
          @initiative = @ci.initiative
        end

        it 'should not be blank' do
          @country.country_url_for(@initiative).should_not be_blank
        end
        
        it 'should return the correct country_url' do
          @country.country_url_for(@initiative).should eq @ci.country_url
        end
      end
    end
    
    describe 'join_dates' do
      before :each do
        @ci = FactoryGirl.create :country_initiative
        @country = @ci.country
        @initiative = @ci.initiative
      end

      it 'should respond to join_date(initiative)' do
        @country.should respond_to(:join_date).with(1).argument
      end

      it 'sholud return the correct join_date' do
        @country.join_date(@initiative).should eq @ci.join_date
      end
    end
  end

  describe 'associations' do
    before :each do
      @country = Country.new @attr
    end

    it 'should respond to page' do
      @country.should respond_to :page
    end

    it 'should respond country_initiatives' do
      @country.should respond_to :country_initiatives
    end

    it 'should respond to initiatives' do
      @country.should respond_to :initiatives
    end

    describe 'country_initiatives' do
      before :each do
        @ci = FactoryGirl.create :country_initiative
        @country = @ci.country
      end

      it 'should return the correct country_initiatives' do
        @country.country_initiatives.should eq [@ci]
      end
    end

    describe 'initiatives' do
      before :each do
        ci = FactoryGirl.create :country_initiative
        @country = ci.country
        @initiative = ci.initiative
      end

      it 'should return the correct initiatives' do
        @country.initiatives.should eq [@initiative]
      end
    end

    describe 'page' do
      before :each do
        @country = FactoryGirl.create(:country, :page => @page = FactoryGirl.create(:page))
      end

      it 'should return the correct page' do
        @country.page.should eq @page
      end
    end
  end

  describe 'actives' do
    it 'should be active by default' do
      Country.new.active.should be_true
    end
  end

  describe 'start_dates' do
    it 'should require a start_date' do
      country = Country.new @attr.merge(:start_date => '')
      country.should_not be_valid
    end

    it 'should reject invalid dates' do
      country = Country.new @attr.merge(:start_date => '1963-24-21')
      country.should_not be_valid
    end

    it 'should reject dates earlier than 1961-01-01' do
      country = Country.new @attr.merge(:start_date => '1960-12-31')
      country.should_not be_valid
    end

    it 'should reject dates in the future' do
      country = Country.new @attr.merge(:start_date => Date.tomorrow.strftime('%Y-%m-%d'))
      country.should_not be_valid
    end
  end

  describe 'names' do
    before :each do
      @country = Country.new @attr
    end

    it 'should set the name based on the code' do
      @country.save!
      @country.name.should eq 'Senegal'
    end
  end

  describe 'contact_emails' do
    it 'should reject contact_emails longer than 255' do
      long = 'a'*256
      Country.new(@attr.merge(:contact_email => long)).should_not be_valid
    end

    it 'should accept valid contact_emails' do
      ['user@example.com','user_user@example.com','user-user@example.com','232@example.com', 'user@234.com', 'user@example-2.com', '_user@example.com', '-user@example.com'].each do |good_email|
        Country.new(@attr.merge(:contact_email => good_email)).should be_valid
      end
    end

    it 'should reject non-valid contact_emails' do
      ['userexample.com','user@example','userexample','user 2@example.com'].each do |bad_email|
        Country.new(@attr.merge(:contact_email => bad_email)).should_not be_valid
      end
    end
  end

  describe 'site_urls' do
    it 'should reject site_urls longer than 255' do
      long = 'a'*256
      Country.new(@attr.merge(:site_url => long)).should_not be_valid
    end

    it 'should allow valid hyperlinks' do
      ['http://www.example.com', 'https://www.example.com', 'http://example.com', 'http://example.com/test.html', 'http://example.com/test', 'http://example.com/?q=test', 'http://example.com?q=test', 'http://example.com/test/?q=test'].each do |good_url|
        Country.new(@attr.merge(:site_url => good_url)).should be_valid
      end
    end

    it 'should reject non-valid hyperlinks' do
      ['www.example.com', 'example.com', 'http/www.example.com', 'http:/www.example.com', 'this is not a link', 'http://www.example.com/this is invalid'].each do |bad_url|
        Country.new(@attr.merge(:site_url => bad_url)).should_not be_valid
      end
    end
  end

  describe 'donate_urls' do
    it 'should reject donate_urls longer than 255' do
      long = 'a'*256
      Country.new(@attr.merge(:donate_url => long)).should_not be_valid
    end

    it 'should allow valid hyperlinks' do
      ['http://www.example.com', 'https://www.example.com', 'http://example.com', 'http://example.com/test.html', 'http://example.com/test', 'http://example.com/?q=test', 'http://example.com?q=test', 'http://example.com/test/?q=test'].each do |good_url|
        Country.new(@attr.merge(:donate_url => good_url)).should be_valid
      end
    end

    it 'should reject non-valid hyperlinks' do
      ['www.example.com', 'example.com', 'http/www.example.com', 'http:/www.example.com', 'this is not a link', 'http://www.example.com/this is invalid'].each do |bad_url|
        Country.new(@attr.merge(:donate_url => bad_url)).should_not be_valid
      end
    end
  end

  describe 'info_urls' do
    it 'should reject donate_urls longer than 255' do
      long = 'a'*256
      Country.new(@attr.merge(:info_url => long)).should_not be_valid
    end

    it 'should allow valid hyperlinks' do
      ['http://www.example.com', 'https://www.example.com', 'http://example.com', 'http://example.com/test.html', 'http://example.com/test', 'http://example.com/?q=test', 'http://example.com?q=test', 'http://example.com/test/?q=test'].each do |good_url|
        Country.new(@attr.merge(:info_url => good_url)).should be_valid
      end
    end

    it 'should reject non-valid hyperlinks' do
      ['www.example.com', 'example.com', 'http/www.example.com', 'http:/www.example.com', 'this is not a link', 'http://www.example.com/this is invalid'].each do |bad_url|
        Country.new(@attr.merge(:info_url => bad_url)).should_not be_valid
      end
    end
  end

  describe 'codes' do
    before :each do
      @attr[:name] = 'Senegal'
    end
    it 'should require a code' do
      country = Country.new @attr.merge(:code => '')
      country.should_not be_valid
    end
    
    it 'should reject fake codes' do
      country = Country.new @attr.merge(:code => 'oe')
      country.should_not be_valid
    end

    it 'should reject duplicate codes' do
      Country.create! @attr
      country = Country.new @attr
      country.should_not be_valid
    end

    it 'should reject codes longer than 2' do
      long = 'a'*3
      hash = @attr.merge(:code => long)
      Country.new(hash).should_not be_valid
    end

    it 'should reject codes shorter than 2' do
      short = 'a'
      hash = @attr.merge(:code => short)
      Country.new(hash).should_not be_valid
    end
  end

  describe 'page_ids' do
    it 'should require a page_id' do
      Country.new(@attr.merge(:page_id => '')).should_not be_valid
    end

    it 'should reject non-numeric ids' do
      Country.new(@attr.merge(:page_id => 'a')).should_not be_valid
    end
  end
end
