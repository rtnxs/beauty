# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  let(:valid_attributes) do
    FactoryBot.attributes_for(:service)
  end
  let(:invalid_attributes) do
    {
      name:  nil,
      price: nil
    }
  end
  let(:valid_session) { {} }
  let(:admin_user) { create(:admin_user) }

  before do
    sign_in admin_user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Service.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      service = Service.create! valid_attributes
      get :show, params: { id: service.to_param }, session: valid_session
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
      service = Service.create! valid_attributes
      get :edit, params: { id: service.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Service' do
        expect do
          post :create, params: { service: valid_attributes }, session: valid_session
        end.to change(Service, :count).by(1)
      end

      it 'redirects to the created service' do
        post :create, params: { service: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Service.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { service: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        FactoryBot.attributes_for(:service)
      end

      it 'updates the requested service' do
        service = Service.create! valid_attributes
        put :update, params: { id: service.to_param, service: new_attributes }, session: valid_session
        service.reload
        expect(response).to redirect_to(service)
      end

      it 'redirects to the service' do
        service = Service.create! valid_attributes
        put :update, params: { id: service.to_param, service: valid_attributes }, session: valid_session
        expect(response).to redirect_to(service)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        service = Service.create! valid_attributes
        put :update, params: { id: service.to_param, service: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested service' do
      service = Service.create! valid_attributes
      expect do
        delete :destroy, params: { id: service.to_param }, session: valid_session
      end.to change(Service, :count).by(-1)
    end

    it 'redirects to the services list' do
      service = Service.create! valid_attributes
      delete :destroy, params: { id: service.to_param }, session: valid_session
      expect(response).to redirect_to(services_url)
    end
  end
end
