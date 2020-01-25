require 'rails_helper'

RSpec.describe "visits/edit", type: :view do
  before(:each) do
    @visit = assign(:visit, Visit.create!(
      :client => nil,
      :visit_price => "9.99",
      :note => "MyString"
    ))
  end

  it "renders the edit visit form" do
    render

    assert_select "form[action=?][method=?]", visit_path(@visit), "post" do

      assert_select "input[name=?]", "visit[client_id]"

      assert_select "input[name=?]", "visit[visit_price]"

      assert_select "input[name=?]", "visit[note]"
    end
  end
end
