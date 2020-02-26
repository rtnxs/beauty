# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClientPolicy, type: :policy do
  subject { described_class.new(user, client) }

  let(:user) { create(:user) }
  let(:client) { create(:client) }

  permissions do
    it { is_expected.to permit_actions(%i[index new create edit update destroy]) }
  end
end
