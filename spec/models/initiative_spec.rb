require 'spec_helper'

describe Initiative do
  before :each do
    @attr = {
      :name => 'Food Security',
      :abbreviation => 'FOODSEC',
      :start_date => '1961-01-02'
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

    pending 'should reject non-alphanumeric characters'
  end

  describe 'contact_emails' do
    it 'should reject contact_emails longer than 255 chars' do
      long = 'a'*256
      Initiative.new(@attr.merge(:contact_email => long)).should_not be_valid
    end

    pending 'should reject non-valid emails'
  end

  describe 'donate_urls' do
    it 'should reject donate_urls longer than 255 chars' do
      long = 'a'*256
      Initiative.new(@attr.merge(:donate_url => long)).should_not be_valid
    end

    pending 'should reject non-valid hyperlinks'
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

  describe 'site_urls' do
    it 'should reject site_urls longer than 255 chars' do
      long = 'a'*256
      Initiative.new(@attr.merge(:site_url => long)).should_not be_valid
    end

    pending 'should reject non-valid hyperlinks'
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
