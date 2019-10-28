FactoryBot.define do
  factory :reservation do
    user { nil }
    room { nil }
    start_date { "2019-10-26 23:09:44" }
    end_date { "2019-10-26 23:09:44" }
    rate { 1 }
    total { 1 }
  end

  factory :photo do
    
  end

  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com" 
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

    factory :room do
    description { "description" }
    association :user
  end
end


    