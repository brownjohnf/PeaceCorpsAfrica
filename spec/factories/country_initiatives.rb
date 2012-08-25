# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :country_initiative do
    country_id 1
    initiative_id 1
    join_date "2012-08-25"
  end
end
