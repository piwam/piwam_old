require 'rails_helper'

describe "contribution_types/index" do
  before(:each) do
    assign(:contribution_types, [
      FactoryGirl.create(:contribution_type, label: 'Cotisation annuelle 2015', amount: 10.00),
      FactoryGirl.create(:contribution_type, label: 'Cotisation annuelle 2016', amount: 10.00)
    ])
  end

  it "renders a list of contribution_types" do
    render
    assert_select "tr>td", text: 'Cotisation annuelle 2015', count: 1
    assert_select "tr>td", text: 'Cotisation annuelle 2016', count: 1
    assert_select "tr>td", text: '10,00 €', count: 2
  end
end
