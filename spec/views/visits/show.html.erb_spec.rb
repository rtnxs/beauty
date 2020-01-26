# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visits/show', type: :view do
  before do
    @visit = assign(:visit, Visit.create!(
                              client:      create(:client),
                              visit_price: '9.99',
                              note:        'Note'
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Note/)
  end
end
