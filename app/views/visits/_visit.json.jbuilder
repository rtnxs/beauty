# frozen_string_literal: true

json.extract! visit, :id, :client_id, :datetime, :visit_price, :note, :created_at, :updated_at
json.url visit_url(visit, format: :json)
