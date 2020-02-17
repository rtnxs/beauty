# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:expense) { create(:expense) }

  it { expect(expense).to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to belong_to(:type) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:datetime) }
  it { is_expected.to validate_length_of(:name).is_at_most(40) }
  it { is_expected.to allow_value('lebosky where is my money').for(:name) }
  it { is_expected.not_to allow_value('@lebosky where my money?').for(:name) }
  it { is_expected.not_to allow_value('"Трата"').for(:name) }
  it { is_expected.not_to allow_value('!@#$%^&*()/"][{}?`~').for(:name) }

  it 'validate price' do
    aggregate_failures 'expected validation on price' do
      expect(expense).to allow_value(100.00).for(:price)
      expect(expense).to allow_value('100.00').for(:price)
      expect(expense).to allow_value('Трата').for(:price)
      expect(expense).to allow_value('!@#$%^&*()/"][{}?`~').for(:price)
    end
  end
end
