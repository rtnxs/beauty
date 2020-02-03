# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visits/show', type: :view do
  let(:visit) { create(:visit) }

  it 'renders attributes in <p>' do
    skip
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Note/)
  end
end
