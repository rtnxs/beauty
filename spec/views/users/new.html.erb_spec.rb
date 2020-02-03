# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  let(:user) { create(:user) }

  it 'renders new user form' do
    skip
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
      assert_select 'input[name=?]', 'user[email]'

      assert_select 'input[name=?]', 'user[password]'

      assert_select 'input[name=?]', 'user[admin]'
    end
  end
end
