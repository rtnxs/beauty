# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses/new', type: :view do
  let(:expense) { create(:expense) }

  it 'renders new expense form' do
    skip
    render

    assert_select 'form[action=?][method=?]', expenses_path, 'post' do
      assert_select 'input[name=?]', 'expense[type_id]'

      assert_select 'input[name=?]', 'expense[name]'

      assert_select 'input[name=?]', 'expense[price]'

      assert_select 'input[name=?]', 'expense[note]'
    end
  end
end
