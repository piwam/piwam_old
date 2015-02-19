require 'rails_helper'

describe "activities/show" do
  before(:each) do
    @activity = assign(:activity, FactoryGirl.create(:activity, label: 'Divers'))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Divers/)
  end
end
