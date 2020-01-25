# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before do
    assign(:users, [
             User.create!(
               email:    'Email',
               password: 'Password',
               admin:    false
             ),
             User.create!(
               email:    'Email',
               password: 'Password',
               admin:    false
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Password'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
