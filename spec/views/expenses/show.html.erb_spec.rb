require 'rails_helper'

RSpec.describe "expenses/show", type: :view do
  before(:each) do
    @expense = assign(:expense, FactoryGirl.create(:expense, label: 'Achats divers', paid: false))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Achats divers/)
    expect(rendered).to match(/Non payée/)
  end
end
