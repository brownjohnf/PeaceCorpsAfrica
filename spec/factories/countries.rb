# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :country do
    code
    start_date '1961-01-02'.to_date

    factory :active_country do
      code
      active true
    end

    factory :inactive_country do
      code
      active false
    end

  end

end
