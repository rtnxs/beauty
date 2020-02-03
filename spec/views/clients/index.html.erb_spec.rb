# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/index', type: :view do
  let(:client) { create(:client) }

  it 'renders a list of clients' do
    skip
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Phone'.to_s, count: 2
    assert_select 'tr>td', text: 'Note'.to_s, count: 2
  end
end
