# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    type { nil }
    name { 'MyString' }
    price { '9.99' }
    note { 'MyString' }
    datetime { '2020-02-02 19:16:31' }
  end
end
