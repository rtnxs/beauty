# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TypesController, type: :controller do
  let(:valid_attributes) do
    FactoryBot.attributes_for(:type)
  end
  let(:invalid_attributes) do
    { name: nil }
  end
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Type.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      type = Type.create! valid_attributes
      get :show, params: { id: type.to_param }, session: valid_session
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
      type = Type.create! valid_attributes
      get :edit, params: { id: type.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Type' do
        expect do
          post :create, params: { type: valid_attributes }, session: valid_session
        end.to change(Type, :count).by(1)
      end

      it 'redirects to the created type' do
        post :create, params: { type: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Type.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { type: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        FactoryBot.attributes_for(:type)
      end

      it 'updates the requested type' do
        type = Type.create! valid_attributes
        put :update, params: { id: type.to_param, type: new_attributes }, session: valid_session
        type.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the type' do
        type = Type.create! valid_attributes
        put :update, params: { id: type.to_param, type: valid_attributes }, session: valid_session
        expect(response).to redirect_to(type)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        type = Type.create! valid_attributes
        put :update, params: { id: type.to_param, type: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested type' do
      type = Type.create! valid_attributes
      expect do
        delete :destroy, params: { id: type.to_param }, session: valid_session
      end.to change(Type, :count).by(-1)
    end

    it 'redirects to the types list' do
      type = Type.create! valid_attributes
      delete :destroy, params: { id: type.to_param }, session: valid_session
      expect(response).to redirect_to(types_url)
    end
  end
end
