# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses/new', type: :view do
  before do
    assign(:expense, Expense.new(
                       type:  nil,
                       name:  'MyString',
                       price: '9.99',
                       note:  'MyString'
                     ))
  end

  it 'renders new expense form' do
    render

    assert_select 'form[action=?][method=?]', expenses_path, 'post' do
      assert_select 'input[name=?]', 'expense[type_id]'

      assert_select 'input[name=?]', 'expense[name]'

      assert_select 'input[name=?]', 'expense[price]'

      assert_select 'input[name=?]', 'expense[note]'
    end
  end
end
