# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :initiative do
    name
    abbreviation
    start_date "2012-08-25"
    page_id 1
  end
end
