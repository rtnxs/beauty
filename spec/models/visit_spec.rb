# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Visit, type: :model do
  let(:visit) { create(:service) }

  it { expect(visit).to be_valid }

  it { is_expected.to belong_to(:client) }
  it { is_expected.to have_and_belong_to_many(:services) }

  it { is_expected.to validate_presence_of(:datetime) }
  it { is_expected.to validate_length_of(:note).is_at_most(255) }

  it 'validate price' do
    aggregate_failures 'expected validation on price' do
      expect(visit).to allow_value(100.00).for(:price)
      expect(visit).to allow_value('100.00').for(:price)
      expect(visit).to allow_value('Трата').for(:price)
      expect(visit).to allow_value('!@#$%^&*()/"][{}?`~').for(:price)
    end
  end
end
