# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VisitPolicy, type: :policy do
  subject { described_class.new(user, visit) }

  let(:user) { create(:user) }
  let(:visit) { create(:visit) }

  permissions do
    it { is_expected.to permit_actions(%i[new create edit update destroy]) }
    it { is_expected.to forbid_actions(%i[index]) }
  end
end
