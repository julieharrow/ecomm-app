# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.create([
  {name: 'Macbook', price: 1000.24, description: "Great buy!", promoted: true, stock: 24},
  {name: 'Chromebook', price: 800.99, description: "Amazing value!", promoted: true, stock: 11},
  {name: 'Surface', price: 1300.89, description: "So unique!", promoted: true, stock: 9},
  {name: 'iPad', price: 649.49, description: "Bring it everywhere!", promoted: true, stock: 18}
  ])

100.times do
  Product.create(name: Faker::Commerce.product_name,
                 price: Faker::Commerce.price,
                 description: Faker::Hipster.sentence,
                 promoted: false,
                 stock: Faker::Number.number(2))
end

10.times do
  Product.create(name: Faker::Commerce.product_name,
                 price: Faker::Commerce.price,
                 description: Faker::Hipster.sentence,
                 promoted: true,
                 stock: Faker::Number.number(2))
end
