# frozen_string_literal: true

class Client < ApplicationRecord
  validates :name, :phone, presence: true
end
