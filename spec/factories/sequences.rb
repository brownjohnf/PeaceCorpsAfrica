FactoryGirl.define do
  
  sequence :email do |n|
    "test-#{n}@example.com"
  end

  sequence :name do |n|
    "Test Name #{n}"
  end

end
