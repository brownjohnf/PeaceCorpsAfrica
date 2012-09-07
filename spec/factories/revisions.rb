# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :revision do
    author
    content
    page
  end
end
