# frozen_string_literal: true

class Client < ApplicationRecord
  validates :name, :phone, presence: true
  validates :name, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
  validates :phone, length: { maximum: 11 }, format: { with: PHONE_REGEXP }
  validates :note, length: { maximum: 255 }
end
