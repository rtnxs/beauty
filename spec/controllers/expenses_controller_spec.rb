# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  let(:type) { create(:type) }
  let(:valid_attributes) do
    FactoryBot.attributes_for(:expense, type_id: type.id)
  end
  let(:invalid_attributes) do
    { type_id: nil, name: nil, price: nil, note: nil, datetime: nil }
  end
  let(:valid_session) { {} }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      user.update(admin: true)
      Expense.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      expense = Expense.create! valid_attributes
      get :show, params: { id: expense.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      expense = Expense.create! valid_attributes
      get :edit, params: { id: expense.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Expense' do
        expect do
          post :create, params: { expense: valid_attributes }, session: valid_session
        end.to change(Expense, :count).by(1)
      end

      it 'redirects to the created expense' do
        post :create, params: { expense: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Expense.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { expense: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:type) { create(:type) }
      let(:new_attributes) do
        FactoryBot.attributes_for(:expense, type_id: type.id)
      end

      it 'updates the requested expense' do
        expense = Expense.create! valid_attributes
        put :update, params: { id: expense.to_param, expense: new_attributes }, session: valid_session
        expense.reload
        expect(response).to redirect_to(expense)
      end

      it 'redirects to the expense' do
        expense = Expense.create! valid_attributes
        put :update, params: { id: expense.to_param, expense: valid_attributes }, session: valid_session
        expect(response).to redirect_to(expense)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        expense = Expense.create! valid_attributes
        put :update, params: { id: expense.to_param, expense: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested expense' do
      expense = Expense.create! valid_attributes
      expect do
        delete :destroy, params: { id: expense.to_param }, session: valid_session
      end.to change(Expense, :count).by(-1)
    end

    it 'redirects to the expenses list' do
      expense = Expense.create! valid_attributes
      delete :destroy, params: { id: expense.to_param }, session: valid_session
      expect(response).to redirect_to(expenses_url)
    end
  end
end
