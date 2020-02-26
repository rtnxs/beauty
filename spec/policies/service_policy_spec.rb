# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServicePolicy, type: :policy do
  subject { described_class.new(user, service) }

  let(:user) { create(:admin_user) }
  let(:service) { create(:service) }

  permissions do
    it { is_expected.to permit_actions(%i[index new create edit update destroy]) }
  end
end
