# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    admin { false }

    factory :admin_user, parent: :user do
      admin { true }
    end
  end
end
