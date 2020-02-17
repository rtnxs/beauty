# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service, type: :model do
  let(:service) { create(:service) }

  it { expect(service).to be_valid }
  it { is_expected.to have_and_belong_to_many(:visits) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_length_of(:name).is_at_most(40) }
  it { is_expected.to allow_value('cut off волосы').for(:name) }
  it { is_expected.not_to allow_value('@cut off волосы?').for(:name) }
  it { is_expected.not_to allow_value('"Волосы долой"').for(:name) }
  it { is_expected.not_to allow_value('!@#$%^&*()/"][{}?`~').for(:name) }

  it 'validate price' do
    aggregate_failures 'expected validation on price' do
      expect(service).to allow_value(100.00).for(:price)
      expect(service).to allow_value('100.00').for(:price)
      expect(service).to allow_value('Трата').for(:price)
      expect(service).to allow_value('!@#$%^&*()/"][{}?`~').for(:price)
    end
  end

  it 'return #name_with_price' do
    name = service.name
    price = service.price

    expect(service.send(:name_with_price)).to eql("#{name} (#{price})")
  end
end
