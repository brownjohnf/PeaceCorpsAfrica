FactoryGirl.define do
  
  sequence :email do |n|
    "test-#{n}@example.com"
  end

  sequence :name do |n|
    "Test Name #{n}"
  end

  sequence :code do |n|
    Carmen.countries[n][1]
  end

  sequence :abbreviation do |n|
    Carmen.countries[n][1] + Carmen.countries[n+1][1]
  end

  sequence :content do |n|
    "<p>Fresh content number #{n}!"
  end

  sequence :title do |n|
    "Shiny Title Number #{n}"
  end

end
