require 'rails_helper'

describe "incomes/show" do
  before(:each) do
    @income = assign(:income, FactoryGirl.create(:income, label: 'Divers'))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Divers/)
  end
end
