# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    name { Faker::Company.industry }
    price { Faker::Commerce.price }
  end
end
