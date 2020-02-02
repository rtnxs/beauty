# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses/show', type: :view do
  before do
    @expense = assign(:expense, Expense.create!(
                                  type:  nil,
                                  name:  'Name',
                                  price: '9.99',
                                  note:  'Note'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Note/)
  end
end
