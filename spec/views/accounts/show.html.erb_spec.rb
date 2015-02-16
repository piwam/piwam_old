require 'rails_helper'

describe "accounts/show" do
  before(:each) do
    @account = assign(:account, FactoryGirl.create(:account,
      label: 'Caisse de monnaie',
      reference: 'CAISSE_MONNAIE'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Caisse de monnaie/)
    expect(rendered).to match(/CAISSE_MONNAIE/)
  end
end
