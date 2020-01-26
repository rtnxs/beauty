# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/show', type: :view do
  before do
    @client = assign(:client, Client.create!(
                                name:  'Name',
                                phone: 'Phone',
                                note:  'Note'
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Note/)
  end
end
