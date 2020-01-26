# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visits/new', type: :view do
  let(:visit) { create(:visit) }

  it 'renders new visit form' do
    skip
    render

    assert_select 'form[action=?][method=?]', visits_path, 'post' do
      assert_select 'input[name=?]', 'visit[visit_price]'

      assert_select 'input[name=?]', 'visit[note]'
    end
  end
end
