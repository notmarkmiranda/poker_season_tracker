FactoryGirl.define do
  factory :participant do |f|
    sequence :first_name do |n|
      "John#{n}"
    end
    sequence :last_name do |n|
      "Doe#{n}"
    end
end
end
