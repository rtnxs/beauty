# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  let(:valid_attributes) do
    FactoryBot.attributes_for(:client)
  end
  let(:invalid_attributes) do
    { name: nil, phone: nil, note: nil }
  end
  let(:valid_session) { {} }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Client.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      client = Client.create! valid_attributes
      get :show, params: { id: client.to_param }, session: valid_session
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
      client = Client.create! valid_attributes
      get :edit, params: { id: client.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Client' do
        expect do
          post :create, params: { client: valid_attributes }, session: valid_session
        end.to change(Client, :count).by(1)
      end

      it 'redirects to the created client' do
        post :create, params: { client: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Client.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { client: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        FactoryBot.attributes_for(:client)
      end

      it 'updates the requested client' do
        client = Client.create! valid_attributes
        put :update, params: { id: client.to_param, client: new_attributes }, session: valid_session
        client.reload
        expect(response).to redirect_to(client)
      end

      it 'redirects to the client' do
        client = Client.create! valid_attributes
        put :update, params: { id: client.to_param, client: valid_attributes }, session: valid_session
        expect(response).to redirect_to(client)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        client = Client.create! valid_attributes
        put :update, params: { id: client.to_param, client: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested client' do
      client = Client.create! valid_attributes
      expect do
        delete :destroy, params: { id: client.to_param }, session: valid_session
      end.to change(Client, :count).by(-1)
    end

    it 'redirects to the clients list' do
      client = Client.create! valid_attributes
      delete :destroy, params: { id: client.to_param }, session: valid_session
      expect(response).to redirect_to(clients_url)
    end
  end
end
