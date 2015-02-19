require 'rails_helper'

describe "activities/index" do
  before(:each) do
    assign(:activities, [
      FactoryGirl.create(:activity, label: 'Activité 1'),
      FactoryGirl.create(:activity, label: 'Activité 2')
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", text: 'Activité 1', count: 1
    assert_select "tr>td", text: 'Activité 2', count: 1
  end
end
