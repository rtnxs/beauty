# frozen_string_literal: true

class Visit < ApplicationRecord
  belongs_to :client
  has_and_belongs_to_many :services

  validates :datetime, presence: true
  validates :note, length: { maximum: 255 }
  # validates :visit_price, format: {with: DECIMAL_REGEXP}
end
