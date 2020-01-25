require 'rails_helper'

RSpec.describe "visits/index", type: :view do
  before(:each) do
    assign(:visits, [
      Visit.create!(
        :client => nil,
        :visit_price => "9.99",
        :note => "Note"
      ),
      Visit.create!(
        :client => nil,
        :visit_price => "9.99",
        :note => "Note"
      )
    ])
  end

  it "renders a list of visits" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
