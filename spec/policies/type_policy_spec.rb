# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TypePolicy, type: :policy do
  subject { described_class.new(user, type) }

  let(:user) { create(:admin_user) }
  let(:type) { create(:type) }

  permissions do
    it { is_expected.to permit_actions(%i[index new create edit update destroy]) }
  end
end
