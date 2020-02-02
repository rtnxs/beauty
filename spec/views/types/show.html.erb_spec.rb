# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'types/show', type: :view do
  before do
    @type = assign(:type, Type.create!(
                            name: 'Name'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
