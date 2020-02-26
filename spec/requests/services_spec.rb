# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Services', type: :request do
  let(:service) { create(:service) }

  it 'creates a Service' do
    get '/services/new'
    expect(response).to have_http_status(302)
  end

  it 'show a Service' do
    get "/services/#{service.id}"
    expect(response).to have_http_status(302)
  end

  it 'edit a Service' do
    get "/services/#{service.id}/edit"
    expect(response).to have_http_status(302)
  end

  it 'show all Services' do
    get '/services'
    expect(response).to have_http_status(302)
  end

  it 'create new Service' do
    post '/services', params: {
      service: {
        name:  Faker::Commerce.department,
        price: Faker::Commerce.price
      }
    }
    expect(response).to have_http_status(302)

    follow_redirect!

    expect(response).to have_http_status(:success)
  end

  it 'update Service' do
    patch "/services/#{service.id}", params: {
      service: {
        name:  Faker::Commerce.department,
        price: Faker::Commerce.price
      }
    }
    expect(response).to have_http_status(302)
    follow_redirect!
    expect(response).to have_http_status(:success)
  end
end
