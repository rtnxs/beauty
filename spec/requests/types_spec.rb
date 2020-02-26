# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Types', type: :request do
  let(:type) { create(:type) }

  it 'creates a Type' do
    get '/types/new'
    expect(response).to have_http_status(302)
  end

  it 'show a Type' do
    get "/types/#{type.id}"
    expect(response).to have_http_status(302)
  end

  it 'edit a Type' do
    get "/types/#{type.id}/edit"
    expect(response).to have_http_status(302)
  end

  it 'show all Types' do
    get '/types'
    expect(response).to have_http_status(302)
  end

  it 'create new Type' do
    post '/types', params: {
      type: {
        name: Faker::Commerce.department
      }
    }
    expect(response).to have_http_status(302)

    follow_redirect!

    expect(response).to have_http_status(:success)
  end

  it 'update Type' do
    patch "/types/#{type.id}", params: {
      type: {
        name: Faker::Commerce.department
      }
    }
    expect(response).to have_http_status(302)

    follow_redirect!

    expect(response).to have_http_status(:success)
  end
end
