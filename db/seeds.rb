# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create default users
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create!(
  :name => 'Jack Brown',
  :email => 'jack@brownjohnf.com',
  :password => 'password',
  :password_confirmation => 'password'
)
puts 'New user created: ' << user.name
user.add_role :admin

user = User.create!(
  :name => 'Chris Hedrick',
  :email => 'chedrick@peacecorps.gov',
  :password => 'hedrick',
  :password_confirmation => 'hedrick'
)
puts 'New user created: ' << user.name
user.add_role :admin

user = User.create!(
  :name => 'Andrew Kistler',
  :email => 'akistler63@gmail.com',
  :password => 'kistler',
  :password_confirmation => 'kistler'
)
puts 'New user created: ' << user.name
user.add_role :admin

# create default countries
puts 'SETTING UP DEFAULT COUNTRIES'
Country.create!([{
  :code => 'BJ',
  :start_date => '1968-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=bn',
  :contact_email => '',
},{
  :code => 'BW',
  :start_date => '1966-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=bc',
  :contact_email => '',
},{
  :code => 'BF',
  :start_date => '1967-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=uv',
  :contact_email => '',
},{
  :code => 'CM',
  :start_date => '1962-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=cm',
  :contact_email => '',
},{
  :code => 'CV',
  :start_date => '1988-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=cv',
  :contact_email => '',
},{
  :code => 'ET',
  :start_date => '1962-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=et',
  :contact_email => '',
},{
  :code => 'GM',
  :start_date => '1967-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=ga',
  :contact_email => '',
},{
  :code => 'GH',
  :start_date => '1961-02-01',
  :site_url => '',
  :donate_url => '',
  :contact_email => '',
},{
  :code => 'GN',
  :start_date => '1963-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=gv',
  :contact_email => '',
},{
  :code => 'KE',
  :start_date => '1964-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=ke',
  :contact_email => '',
},{
  :code => 'LS',
  :start_date => '1967-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=lt',
  :contact_email => '',
},{
  :code => 'LR',
  :start_date => '1962-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=li',
  :contact_email => '',
},{
  :code => 'MG',
  :start_date => '1993-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=ma',
  :contact_email => '',
},{
  :code => 'MW',
  :start_date => '1963-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=mi',
  :contact_email => '',
},{
  :code => 'ML',
  :start_date => '1970-03-24',
  :site_url => '',
  :donate_url => '',
  :contact_email => '',
  :active => false
},{
  :code => 'MZ',
  :start_date => '1998-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=mi',
  :contact_email => '',
},{
  :code => 'NA',
  :start_date => '1990-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=mi',
  :contact_email => '',
},{
  :code => 'RW',
  :start_date => '1975-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=rw',
  :contact_email => '',
},{
  :code => 'SN',
  :start_date => '1963-02-15',
  :site_url => '',
  :donate_url => '',
  :contact_email => '',
},{
  :code => 'SL',
  :start_date => '1962-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=sl',
  :contact_email => '',
},{
  :code => 'ZA',
  :start_date => '1997-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=sf',
  :contact_email => '',
},{
  :code => 'SZ',
  :start_date => '1969-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=wz',
  :contact_email => '',
},{
  :code => 'TZ',
  :start_date => '1961-01-01',
  :site_url => '',
  :donate_url => 'http://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=tz',
  :contact_email => '',
},{
  :code => 'TG',
  :start_date => '1962-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=to',
  :contact_email => '',
},{
  :code => 'UG',
  :start_date => '1964-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=ug',
  :contact_email => '',
},{
  :code => 'ZM',
  :start_date => '1994-01-01',
  :site_url => '',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.donatenow&country=za',
  :contact_email => '',
}])

# create default initiatives
puts 'SETTING UP DEFOULT INITIATIVES'
Initiative.create!([{
  :name => 'Stomping Out Malaria in Africa',
  :abbreviation => 'STOMP',
  :start_date => '2011-04-25',
  :donate_url => 'https://donate.peacecorps.gov/index.cfm?shell=donate.contribute.projDetail&projdesc=SPF-MLR',
  :site_url => 'http://www.stompoutmalaria.org'
},{
  :name => 'Food Security',
  :abbreviation => 'FOODSEC',
  :start_date => '2009-08-28'
},{
  :name => 'HIV/AIDS Prevention',
  :abbreviation => 'HIVAIDS',
  :start_date => '1995-03-24'
}])

# create country/initiative associations
puts 'ADDING COUNTRIES TO INITIATIVES'
CountryInitiative.create!([{
  :country_id => Country.find_by_code('SN').id,
  :initiative_id => Initiative.find_by_abbreviation('STOMP').id
},{
  :country_id => Country.find_by_code('SN').id,
  :initiative_id => Initiative.find_by_abbreviation('FOODSEC').id
},{
  :country_id => Country.find_by_code('GH').id,
  :initiative_id => Initiative.find_by_abbreviation('FOODSEC').id
},{
  :country_id => Country.find_by_code('ML').id,
  :initiative_id => Initiative.find_by_abbreviation('STOMP').id
},{
  :country_id => Country.find_by_code('ML').id,
  :initiative_id => Initiative.find_by_abbreviation('FOODSEC').id
}])
