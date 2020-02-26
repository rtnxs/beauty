# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Devise', type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/users/sign_in').to route_to('devise/sessions#new')
    end

    it 'routes to #create' do
      expect(post: '/users/sign_in').to route_to('devise/sessions#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/sign_out').to route_to('devise/sessions#destroy')
    end

    it 'routes to #new password' do
      expect(get: '/users/password/new').not_to route_to('devise/passwords#new')
    end

    it 'routes to #edit password' do
      expect(get: '/users/password/edit').not_to route_to('devise/passwords#edit')
    end

    it 'routes to #cancel_user_registration' do
      expect(get: '/users/cancel').not_to route_to('devise/registrations#cancel')
    end

    it 'routes to #new_user_registration' do
      expect(get: '/users/sign_up').not_to route_to('devise/registrations#new')
    end

    it 'routes to #edit_user_registration' do
      expect(get: '/users/edit').not_to route_to('devise/registrations#edit')
    end
  end
end
