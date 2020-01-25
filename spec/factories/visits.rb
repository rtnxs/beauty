# frozen_string_literal: true

FactoryBot.define do
  factory :visit do
    client { nil }
    datetime { '2020-01-25 19:32:06' }
    visit_price { '9.99' }
    note { 'MyString' }
  end
end
