# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Type, type: :model do
  let(:type) { create(:type) }

  it { expect(type).to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(40) }
  it { is_expected.to allow_value('cut off волосы').for(:name) }
  it { is_expected.not_to allow_value('@cut off волосы?').for(:name) }
  it { is_expected.not_to allow_value('"Волосы долой"').for(:name) }
  it { is_expected.not_to allow_value('!@#$%^&*()/"][{}?`~').for(:name) }
end
