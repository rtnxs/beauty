# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visits/edit', type: :view do
  let(:visit) { create(:visit) }

  it 'renders the edit visit form' do
    skip
    render

    assert_select 'form[action=?][method=?]', visit_path(visit), 'post' do
      assert_select 'input[name=?]', 'visit[visit_price]'

      assert_select 'input[name=?]', 'visit[note]'
    end
  end
end
