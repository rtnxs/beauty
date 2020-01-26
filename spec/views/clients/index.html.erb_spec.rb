# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/index', type: :view do
  before do
    assign(:clients, [
             Client.create!(
               name:  'Name',
               phone: 'Phone',
               note:  'Note'
             ),
             Client.create!(
               name:  'Name',
               phone: 'Phone',
               note:  'Note'
             )
           ])
  end

  it 'renders a list of clients' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Phone'.to_s, count: 2
    assert_select 'tr>td', text: 'Note'.to_s, count: 2
  end
end
