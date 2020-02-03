# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses/index', type: :view do
  let(:expense) { create(:expense) }

  it 'renders a list of expenses' do
    skip
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: 'Note'.to_s, count: 2
  end
end
