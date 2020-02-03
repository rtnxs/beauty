# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    type
    name { Faker::Commerce.department }
    visit_price { Faker::Commerce.price }
    note { 'MyString' }
    datetime { '2020-02-02 19:16:31' }
  end
end
