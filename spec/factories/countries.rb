# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :country do
    code "sn"
    pc_start_date '1963-02-15'.to_date
  end
end
