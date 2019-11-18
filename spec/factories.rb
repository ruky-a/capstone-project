FactoryBot.define do
  factory :comment do
    
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
