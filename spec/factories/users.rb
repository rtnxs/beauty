# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    email { Faker::Internet.safe_email(name: 'User') }
    password { Faker::Internet.password }
    admin { false }
  end
end
