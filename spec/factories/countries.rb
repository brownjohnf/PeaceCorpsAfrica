# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :country do
    code "sn"
    pc_start_date '1961-01-02'.to_date

    factory :active_country do
      active true
    end

    factory :inactive_country do
      active false
    end

  end

end
