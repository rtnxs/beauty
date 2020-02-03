# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses/edit', type: :view do
  let(:expense) { create(:expense) }

  it 'renders the edit expense form' do
    skip
    render

    assert_select 'form[action=?][method=?]', expense_path(expense), 'post' do
      assert_select 'input[name=?]', 'expense[type_id]'

      assert_select 'input[name=?]', 'expense[name]'

      assert_select 'input[name=?]', 'expense[price]'

      assert_select 'input[name=?]', 'expense[note]'
    end
  end
end
