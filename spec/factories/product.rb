# spec/factories/users.rb
FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    code { "#{Faker::Alphanumeric.alpha(number: 2).upcase}#{Faker::Number.number(digits: 1)}" }
    price { Faker::Commerce.price(range: 1.0..10.0) }
  end
end


