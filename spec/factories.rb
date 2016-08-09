FactoryGirl.define do
  factory :product do
    sequence(:name) {|num| "##{num} Macbook"}
    price 1009.99
    description "Great laptop - you should buy it!"
    stock 30
    promoted false
  end

  factor :user do
    name "User"
    email "user@user.com"
    password "password"
    password_confirmation "password"
    admin false
  end
end
