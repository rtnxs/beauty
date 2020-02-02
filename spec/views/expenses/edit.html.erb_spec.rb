# frozen_string_literal: true
# # frozen_string_literal: true
#
# require 'rails_helper'
#
# RSpec.describe 'expenses/edit', type: :view do
#   before do
#     @expense = assign(:expense, Expense.create!(
#                                   type:  nil,
#                                   name:  'MyString',
#                                   price: '9.99',
#                                   note:  'MyString'
#                                 ))
#   end
#
#   it 'renders the edit expense form' do
#     render
#
#     assert_select 'form[action=?][method=?]', expense_path(@expense), 'post' do
#       assert_select 'input[name=?]', 'expense[type_id]'
#
#       assert_select 'input[name=?]', 'expense[name]'
#
#       assert_select 'input[name=?]', 'expense[price]'
#
#       assert_select 'input[name=?]', 'expense[note]'
#     end
#   end
# end
