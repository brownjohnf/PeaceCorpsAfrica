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
  :name => 'First User',
  :email => 'user@example.com',
  :password => 'please',
  :password_confirmation => 'please'
)
puts 'New user created: ' << user.name
user2 = User.create!(
  :name => 'Second User',
  :email => 'user2@example.com',
  :password => 'please',
  :password_confirmation => 'please'
)
puts 'New user created: ' << user2.name
user.add_role :admin

# create default countries
puts 'SETTING UP DEFAULT COUNTRIES'
Country.create!([{
  :code => 'SN',
  :pc_start_date => '1963-02-15',
  :active => true
},{
  :code => 'GH',
  :pc_start_date => '1961-02-01',
  :active => true
},{
  :code => 'ML',
  :pc_start_date => '1970-03-24',
  :active => false
}])

# create default initiatives
puts 'SETTING UP DEFOULT INITIATIVES'
Initiative.create!([{
  :name => 'Stomping Out Malaria in Africa',
  :abbreviation => 'STOMP',
  :start_date => '2011-01-01'
},{
  :name => 'Food Security',
  :abbreviation => 'FOODSEC',
  :start_date => '2009-08-28'
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
