# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :initiative do
    name "MyString"
    start_date "2012-08-25"
    page_id 1
    num_participants 1
  end
end
