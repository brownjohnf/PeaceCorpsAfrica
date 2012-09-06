# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :initiative do
    name
    abbreviation
    page
    start_date "2012-08-25"
  end
end
