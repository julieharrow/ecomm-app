FactoryGirl.define do
  factory :product do
    sequence(:name) {|num| "##{num} Macbook"}
    price 1009.99
    description "Great laptop - you should buy it!"
    stock 30
    promoted false
  end

  factory :admin_user, class: User do
    name "Admin User"
    sequence (:email) {|num| "admin_user##{num}@user.com"} #email must be unique for devise
    password "password"
    password_confirmation "password"
    admin true
  end

  factory :non_admin_user, class: User do
    name "Regular User"
    sequence (:email) {|num| "regular_user##{num}@user.com"} #email must be unique for devise
    password "password"
    password_confirmation "password"
    admin false
  end

  factory :cart do
    association :user, factory: :non_admin_user    # not simply put because we have a two factories for 'user - we need to specify the factory which is the subject of the association
  end

  factory :line_item do
    product    # simply put because we have a factory named 'product'
    cart    # simply put because we have a factory named 'cart'
  end

end
