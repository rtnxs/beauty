# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/show', type: :view do
  let(:client) { create(:client) }

  it 'renders attributes in <p>' do
    skip
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Note/)
  end
end
