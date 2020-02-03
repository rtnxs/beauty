# frozen_string_literal: true

class Type < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
end
