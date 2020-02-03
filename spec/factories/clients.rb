# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    phone { "7920#{Faker::Number.number(digits: 7)}" }
    note { Faker::Address.full_address }
  end
end
