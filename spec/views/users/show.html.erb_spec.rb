# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before do
    @user = assign(:user, User.create!(
                            email:    'Email',
                            password: 'Password',
                            admin:    false
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/false/)
  end
end
