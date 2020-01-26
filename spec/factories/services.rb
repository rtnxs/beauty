# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    name { Faker::Commerce.department }
    price { Faker::Commerce.price }
  end
end
