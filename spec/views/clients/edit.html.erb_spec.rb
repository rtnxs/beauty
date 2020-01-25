# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/edit', type: :view do
  before do
    @client = assign(:client, Client.create!(
                                name:  'MyString',
                                phone: 'MyString',
                                note:  'MyString'
                              ))
  end

  it 'renders the edit client form' do
    render

    assert_select 'form[action=?][method=?]', client_path(@client), 'post' do
      assert_select 'input[name=?]', 'client[name]'

      assert_select 'input[name=?]', 'client[phone]'

      assert_select 'input[name=?]', 'client[note]'
    end
  end
end
