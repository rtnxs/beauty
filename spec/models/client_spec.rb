# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  let(:client) { create(:client) }

  it { expect(client).to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to validate_uniqueness_of(:phone) }
  it { is_expected.to validate_length_of(:name).is_at_most(40) }
  it { is_expected.to validate_length_of(:phone).is_at_most(11) }
  it { is_expected.to validate_length_of(:note).is_at_most(255) }
  it { is_expected.not_to allow_value('@vanya123').for(:name) }
  it { is_expected.not_to allow_value('"Вася"').for(:name) }
  it { is_expected.not_to allow_value('!@#$%^&*()/"][{}?`~').for(:name) }
  it { is_expected.not_to allow_value('Вася1111111').for(:phone) }
  it { is_expected.not_to allow_value('"Вася"').for(:phone) }
  it { is_expected.not_to allow_value('!@#$%^&*()/"][{}?`~').for(:phone) }
end
