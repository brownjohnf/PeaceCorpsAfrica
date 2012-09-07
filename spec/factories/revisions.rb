# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :revision do
    author
    content "MyText"
    page
  end
end
