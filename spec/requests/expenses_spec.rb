# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  let(:expense) { create(:expense) }

  it 'creates a Expense' do
    get '/expenses/new'
    expect(response).to have_http_status(200)
  end

  it 'show a Expense' do
    get "/expenses/#{expense.id}"
    expect(response).to have_http_status(200)
  end

  it 'edit a Expense' do
    get "/expenses/#{expense.id}/edit"
    expect(response).to have_http_status(200)
  end

  it 'show all Expenses' do
    get '/expenses'
    expect(response).to have_http_status(200)
  end

  it 'create new Expense' do
    post '/expenses', params: {
      expense: {
        type_id:  expense.type.id,
        name:     Faker::Commerce.department,
        price:    Faker::Commerce.price,
        datetime: '2020-12-02 19:16:31'
      }
    }
    expect(response).to have_http_status(302)
    follow_redirect!
    expect(response).to have_http_status(:success)
  end

  it 'update Expense' do
    patch "/expenses/#{expense.id}", params: {
        expense: {
            type_id:  expense.type.id,
            name:     Faker::Commerce.department,
            price:    Faker::Commerce.price,
            datetime: '2020-12-02 19:16:31'
        }
    }
    expect(response).to have_http_status(302)
    follow_redirect!
    expect(response).to have_http_status(:success)
  end
end
