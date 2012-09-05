# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title "MyString"
    html "MyText"
    locked_by 1
    locked_at "2012-09-05 22:28:29"
  end
end
