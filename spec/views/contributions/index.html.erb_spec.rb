require 'rails_helper'

describe "contributions/index" do
  before(:each) do
    assign(:contributions, Kaminari.paginate_array([
      FactoryGirl.create(:contribution, date: '2015-02-18', amount: 10.00),
      FactoryGirl.create(:contribution, date: '2015-02-20', amount: 10.00)
    ]).page(1))
  end

  it "renders a list of contributions" do
    render
    assert_select "tr>td", text: '18/02/2015', count: 1
    assert_select "tr>td", text: '20/02/2015', count: 1
    assert_select "tr>td", text: '10,00 €', count: 2
  end
end
