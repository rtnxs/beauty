# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :type

  validates :name, :price, :datetime, presence: true
  validates :name, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
  validates :price, format: { with: DECIMAL_REGEXP }
end
