# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'services/edit', type: :view do
  let(:service) { create(:service) }

  it 'renders the edit service form' do
    skip
    render

    assert_select 'form[action=?][method=?]', service_path(service), 'post' do
      assert_select 'input[name=?]', 'service[name]'

      assert_select 'input[name=?]', 'service[price]'
    end
  end
end
