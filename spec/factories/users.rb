FactoryGirl.define do
  factory :user do
    # sequence(:email) { |n| "person#{n}@example.com" }
    email "person1@example.com"
    password "helloworld"
    password_confirmation "helloworld"
  end
end
