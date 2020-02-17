# frozen_string_literal: true

class Service < ApplicationRecord
  has_and_belongs_to_many :visits

  validates :name, :price, presence: true
  validates :name, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
  validates :price, format: { with: DECIMAL_REGEXP }

  def name_with_price
    "#{name} (#{price})"
  end
end
