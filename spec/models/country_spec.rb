require 'spec_helper'

describe Country do
  before :each do
    @attr = {
      :code => 'SN',
      :start_date => '1961-01-02'
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

    it 'should respond to name' do
      @country.should respond_to(:name)
    end

    it 'should respond to num_total_volunteers' do
      @country.should respond_to(:num_total_volunteers)
    end

    it 'should respond to num_volunteers' do
      @country.should respond_to(:num_volunteers)
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

    it 'should have a name attribute' do
      @country.should respond_to :name
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
  end

  describe 'site_urls' do
    it 'should reject site_urls longer than 255' do
      long = 'a'*256
      Country.new(@attr.merge(:site_url => long)).should_not be_valid
    end
  end

  describe 'donate_urls' do
    it 'should reject donate_urls longer than 255' do
      long = 'a'*256
      Country.new(@attr.merge(:donate_url => long)).should_not be_valid
    end
  end

  describe 'num_volunteers' do
    it 'should default to 0' do
      Country.new.num_volunteers.should eq 0
    end
  end

  describe 'num_total_volunteers' do
    it 'should default to 0' do
      Country.new.num_total_volunteers.should eq 0
    end
  end

  describe 'codes' do
    it 'should require a code' do
      country = Country.new @attr.merge(:code => '')
      country.should_not be_valid
    end
    
    it 'should reject fake codes' do
      country = Country.new @attr.merge(:code => 'oe')
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

end
