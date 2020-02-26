# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visits', type: :request do
  let(:visit) { create(:visit) }

  it 'creates a Visit' do
    get '/visits/new'
    expect(response).to have_http_status(302)
  end

  it 'show a Visit' do
    get "/visits/#{visit.id}"
    expect(response).to have_http_status(302)
  end

  it 'edit a Visit' do
    get "/visits/#{visit.id}/edit"
    expect(response).to have_http_status(302)
  end

  it 'show all Visits' do
    get '/expenses'
    expect(response).to have_http_status(302)
  end

  it 'create new Visit' do
    post '/visits', params: {
      visit: {
        client_id:   visit.client.id,
        visit_price: Faker::Commerce.price,
        datetime:    '2020-12-02 19:16:31'
      }
    }
    expect(response).to have_http_status(302)
    follow_redirect!
    expect(response).to have_http_status(:success)
  end

  it 'update Visit' do
    patch "/visits/#{visit.id}", params: {
      visit: {
        client_id:   visit.client.id,
        visit_price: Faker::Commerce.price,
        datetime:    '2020-12-02 19:16:31'
      }
    }
    expect(response).to have_http_status(302)
    follow_redirect!
    expect(response).to have_http_status(:success)
  end
end
