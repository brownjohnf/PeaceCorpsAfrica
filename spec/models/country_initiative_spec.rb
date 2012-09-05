require 'spec_helper'

describe CountryInitiative do
  before :each do
    @attr = {
      :country_id => 1,
      :initiative_id => 1
    }
  end

  it 'should create a new instance given valid attributes' do
    CountryInitiative.create! @attr
  end

  describe 'properties' do
    before :each do
      @country_initiative = CountryInitiative.new @attr
    end

    it 'should respond to country_id' do
      @country_initiative.should respond_to :country_id
    end

    it 'should respond to initiative_id' do
      @country_initiative.should respond_to :initiative_id
    end

    it 'should respond to join_date' do
      @country_initiative.should respond_to :join_date
    end

    it 'should respond to site_url' do
      @country_initiative.should respond_to :site_url
    end
  end

  describe 'country_ids' do
    it 'should require a country_id' do
      CountryInitiative.new(@attr.merge(:country_id => '')).should_not be_valid
    end
  end

  describe 'initiative_ids' do
    it 'should require an initiative_id' do
      CountryInitiative.new(@attr.merge(:initiative_id => '')).should_not be_valid
    end
  end

  describe 'join_dates' do
    it 'should ignore join_dates' do
      country_initiative = CountryInitiative.new @attr.merge(:join_date => '1963-24-21')
      country_initiative.save!
      country_initiative.should be_valid
    end

    it 'should reject join_dates earlier than 1961-01-01' do
      country_initiative = CountryInitiative.new @attr.merge(:join_date => '1960-12-31')
      country_initiative.should_not be_valid
    end

    it 'should reject join_dates in the future' do
      country_initiative = CountryInitiative.new @attr.merge(:join_date => Date.tomorrow.strftime('%Y-%m-%d'))
      country_initiative.should_not be_valid
    end
  end

  describe 'site_urls' do
    it 'should reject site_urls longer than 255' do
      long = 'a'*256
      CountryInitiative.new(@attr.merge(:site_url => long)).should_not be_valid
    end

    it 'should allow valid hyperlinks' do
      ['http://www.example.com', 'https://www.example.com', 'http://example.com', 'http://example.com/test.html', 'http://example.com/test', 'http://example.com/?q=test', 'http://example.com?q=test', 'http://example.com/test/?q=test'].each do |good_url|
        CountryInitiative.new(@attr.merge(:site_url => good_url)).should be_valid
      end
    end

    it 'should reject non-valid hyperlinks' do
      ['www.example.com', 'example.com', 'http/www.example.com', 'http:/www.example.com', 'this is not a link', 'http://www.example.com/this is invalid'].each do |bad_url|
        CountryInitiative.new(@attr.merge(:site_url => bad_url)).should_not be_valid
      end
    end
  end
end
