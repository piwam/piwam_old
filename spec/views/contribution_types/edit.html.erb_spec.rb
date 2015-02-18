require 'rails_helper'

describe "contribution_types/edit" do
  before(:each) do
    @contribution_type = assign(:contribution_type, FactoryGirl.create(:contribution_type))
  end

  it "renders the edit contribution_type form" do
    render

    assert_select "form[action=?][method=?]", contribution_type_path(@contribution_type), "post" do
      assert_select "input#contribution_type_label[name=?]", "contribution_type[label]"
      assert_select "input#contribution_type_amount[name=?]", "contribution_type[amount]"
    end
  end
end
