# frozen_string_literal: true

FactoryBot.define do
  factory :type do
    name { Faker::Commerce.department }
  end
end
