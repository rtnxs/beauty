# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    type
    name { Faker::Commerce.department }
    price { Faker::Commerce.price }
    note { Faker::Commerce.department }
    datetime { '2020-12-02 19:16:31' }
  end
end
