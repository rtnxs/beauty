# frozen_string_literal: true

class Visit < ApplicationRecord
  belongs_to :client
  has_and_belongs_to_many :services
end
