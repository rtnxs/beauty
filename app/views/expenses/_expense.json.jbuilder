# frozen_string_literal: true

json.extract! expense, :id, :type_id, :name, :price, :note, :datetime, :created_at, :updated_at
json.url expense_url(expense, format: :json)
