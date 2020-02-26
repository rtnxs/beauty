# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaffPolicy, type: :policy do
  subject(:staff) { StaffPolicy }

  let(:user) { create(:admin_user) }

  permissions :index? do
    it 'grants access if user admin' do
      expect(staff).to permit(user), StaffPolicy
    end

    it 'denies access if user not admin' do
      user.update(admin: false)
      expect(staff).not_to permit(user), StaffPolicy
    end
  end

  permissions :new?, :create?, :edit?, :update?, :destroy? do
    it 'denies access for all role' do
      expect(staff).not_to permit(user), StaffPolicy
      user.update(admin: false)
      expect(staff).not_to permit(user), StaffPolicy
    end
  end
end
