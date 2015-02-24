require 'rails_helper'

describe "incomes/show" do
  before(:each) do
    @income = assign(:income, FactoryGirl.create(:income, label: 'Divers', received: false))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Divers/)
    expect(rendered).to match(/Non perçue/)
  end
end
