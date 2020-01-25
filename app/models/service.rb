# frozen_string_literal: true

class Service < ApplicationRecord
  has_and_belongs_to_many :visits
end
