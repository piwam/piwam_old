require 'rails_helper'

describe "contribution_types/new" do
  before(:each) do
    assign(:contribution_type, ContributionType.new)
  end

  it "renders new contribution_type form" do
    render

    assert_select "form[action=?][method=?]", contribution_types_path, "post" do
      assert_select "input#contribution_type_label[name=?]", "contribution_type[label]"
      assert_select "input#contribution_type_amount[name=?]", "contribution_type[amount]"
    end
  end
end
