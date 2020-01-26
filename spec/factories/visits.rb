# frozen_string_literal: true

FactoryBot.define do
  factory :visit do
    client
    datetime { '2020-01-25 19:32:06' }
    visit_price { Faker::Commerce.price }
    note { Faker::Address.full_address }
  end
end
