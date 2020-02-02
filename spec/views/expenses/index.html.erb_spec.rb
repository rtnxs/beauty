# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses/index', type: :view do
  before do
    assign(:expenses, [
             Expense.create!(
               type:  nil,
               name:  'Name',
               price: '9.99',
               note:  'Note'
             ),
             Expense.create!(
               type:  nil,
               name:  'Name',
               price: '9.99',
               note:  'Note'
             )
           ])
  end

  it 'renders a list of expenses' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: 'Note'.to_s, count: 2
  end
end
