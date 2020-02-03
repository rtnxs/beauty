# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visits/index', type: :view do
  let(:visit) { create(:visit) }

  it 'renders a list of visits' do
    skip
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: 'Note'.to_s, count: 2
  end
end
