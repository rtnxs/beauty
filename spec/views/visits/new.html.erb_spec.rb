# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visits/new', type: :view do
  let(:client) { create(:client) }

  before do
    assign(:visit, Visit.new(
                     client:      client,
                     visit_price: '9.99',
                     note:        'MyString'
                   ))
  end

  it 'renders new visit form' do
    render

    assert_select 'form[action=?][method=?]', visits_path, 'post' do

      assert_select 'input[name=?]', 'visit[visit_price]'

      assert_select 'input[name=?]', 'visit[note]'
    end
  end
end
