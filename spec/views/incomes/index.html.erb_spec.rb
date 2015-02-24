require 'rails_helper'

describe "incomes/index" do
  before(:each) do
    assign(:incomes, Kaminari.paginate_array([
      FactoryGirl.create(:income, date: '2015-02-18', amount: 10.00, received: true),
      FactoryGirl.create(:income, date: '2015-02-20', amount: 10.00, received: false)
    ]).page(1))
  end

  it "renders a list of incomes" do
    render
    assert_select "tr>td", text: '18/02/2015', count: 1
    assert_select "tr>td", text: 'Non perçue', count: 1
    assert_select "tr>td", text: '10,00 €', count: 2
  end
end
