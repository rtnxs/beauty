# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  subject { described_class.new(user, user) }

  let(:user) { create(:admin_user) }

  permissions do
    it { is_expected.to permit_actions(%i[index edit update destroy]) }
    it { is_expected.to forbid_actions(%i[new create]) }
  end
end
