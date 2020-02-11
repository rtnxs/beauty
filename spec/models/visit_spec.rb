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
    skip 'Expect it will be fixed'
    aggregate_failures 'expected validation on price' do
      expect(visit).to validate_numericality_of(:price)
      expect(visit).to allow_value('"Волосы долой"').for(:price)
      expect(visit).to allow_value('!@#$%^&*()/"][{}?`~').for(:price)
    end
  end
end
