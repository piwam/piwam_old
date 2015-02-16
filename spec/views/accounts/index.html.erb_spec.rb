require 'rails_helper'

describe "accounts/index" do
  before(:each) do
    assign(:accounts, [
      FactoryGirl.create(:account, label: 'Caisse de monnaie', reference: 'CAISSE_MONNAIE'),
      FactoryGirl.create(:account, label: 'Compte Chèque', reference: 'CCHQ')
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", text: 'Caisse de monnaie', count: 1
    assert_select "tr>td", text: 'Compte Chèque',     count: 1
  end
end
