# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/edit', type: :view do
  let(:client) { create(:client) }

  it 'renders the edit client form' do
    skip
    render

    assert_select 'form[action=?][method=?]', client_path(client), 'post' do
      assert_select 'input[name=?]', 'client[name]'

      assert_select 'input[name=?]', 'client[phone]'

      assert_select 'input[name=?]', 'client[note]'
    end
  end
end
