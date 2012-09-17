# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reference do
    link_source
    link_target
    link_text 'mystring'
  end
end
