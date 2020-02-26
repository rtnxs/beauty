# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VisitsController, type: :controller do
  let(:service) { create(:service) }
  let(:client) { create(:client) }
  let(:valid_attributes) do
    FactoryBot.attributes_for(:visit, service_ids: [service.id], client_id: client.id)
  end
  let(:invalid_attributes) do
    {
      client_id:   nil,
      datetime:    nil,
      visit_price: nil,
      note:        nil
    }
  end
  let(:valid_session) { {} }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      user.update(admin: true)
      Visit.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      visit = Visit.create! valid_attributes
      get :show, params: { id: visit.to_param }, session: valid_session
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
      visit = Visit.create! valid_attributes
      get :edit, params: { id: visit.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Visit' do
        expect do
          post :create, params: { visit: valid_attributes }, session: valid_session
        end.to change(Visit, :count).by(1)
      end

      it 'redirects to the created visit' do
        post :create, params: { visit: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Visit.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { visit: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        FactoryBot.attributes_for(:visit, service_ids: [service.id], client_id: client.id)
      end

      it 'updates the requested visit' do
        visit = Visit.create! valid_attributes
        put :update, params: { id: visit.to_param, visit: new_attributes }, session: valid_session
        visit.reload
        expect(response).to redirect_to(visit)
      end

      it 'redirects to the visit' do
        visit = Visit.create! valid_attributes
        put :update, params: { id: visit.to_param, visit: valid_attributes }, session: valid_session
        expect(response).to redirect_to(visit)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        visit = Visit.create! valid_attributes
        put :update, params: { id: visit.to_param, visit: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested visit' do
      visit = Visit.create! valid_attributes
      expect do
        delete :destroy, params: { id: visit.to_param }, session: valid_session
      end.to change(Visit, :count).by(-1)
    end

    it 'redirects to the visits list' do
      visit = Visit.create! valid_attributes
      delete :destroy, params: { id: visit.to_param }, session: valid_session
      expect(response).to redirect_to(visits_url)
    end
  end
end
