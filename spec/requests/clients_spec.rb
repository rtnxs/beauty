# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  let(:client) { create(:client) }

  it 'creates a Client' do
    get '/clients/new'
    expect(response).to have_http_status(200)
  end

  it 'show a Client' do
    get "/clients/#{client.id}"
    expect(response).to have_http_status(200)
  end

  it 'edit a Client' do
    get "/clients/#{client.id}/edit"
    expect(response).to have_http_status(200)
  end

  it 'show all Clients' do
    get '/clients'
    expect(response).to have_http_status(200)
  end

  it 'create new Client' do
    post '/clients', params: { client: { name: 'Коля', phone: '88888888888' } }
    expect(response).to have_http_status(302)
    follow_redirect!
    expect(response).to have_http_status(:success)
  end

  it 'update Client' do
    patch "/clients/#{client.id}", params: { client: { name: 'Не Коля', phone: '0000000000' } }
    expect(response).to have_http_status(302)
    follow_redirect!
    expect(response).to have_http_status(:success)
  end
end
