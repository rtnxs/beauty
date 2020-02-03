# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/new', type: :view do
  let(:client) { create(:client) }

  it 'renders new client form' do
    skip
    render

    assert_select 'form[action=?][method=?]', clients_path, 'post' do
      assert_select 'input[name=?]', 'client[name]'

      assert_select 'input[name=?]', 'client[phone]'

      assert_select 'input[name=?]', 'client[note]'
    end
  end
end
