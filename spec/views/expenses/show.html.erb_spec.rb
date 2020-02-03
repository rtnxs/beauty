# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses/show', type: :view do
  let(:expense) { create(:expense) }

  it 'renders attributes in <p>' do
    skip
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Note/)
  end
end
