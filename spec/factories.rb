FactoryGirl.define do
  factory :product do
    sequence(:name) {|num| "##{num} Macbook"}
    price 1009.99
    description "Great laptop - you should buy it!"
    stock 30
    promoted false
  end

  factory :user do
    name "User"
    sequence (:email) {|num| "user##{num}@user.com"} #email must be unique for devise
    password "password"
    password_confirmation "password"
    admin false
  end
end
