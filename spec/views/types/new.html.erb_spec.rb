# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'types/new', type: :view do
  before do
    assign(:type, Type.new(
                    name: 'MyString'
                  ))
  end

  it 'renders new type form' do
    render

    assert_select 'form[action=?][method=?]', types_path, 'post' do
      assert_select 'input[name=?]', 'type[name]'
    end
  end
end
