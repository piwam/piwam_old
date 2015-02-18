require 'rails_helper'

RSpec.describe "statuses/index", type: :view do
  before(:each) do
    assign(:statuses, [
      FactoryGirl.create(:status, label: 'Président'),
      FactoryGirl.create(:status, label: 'Trésorier')
    ])
  end

  it "renders a list of statuses" do
    render
    assert_select "tr>td", text: 'Président', count: 1
    assert_select "tr>td", text: 'Trésorier', count: 1
  end
end
