require 'rails_helper'

describe "contributions/new" do
  before(:each) do
    assign(:contribution, Contribution.new)
  end

  it "renders new contribution form" do
    render

    assert_select "form[action=?][method=?]", contributions_path, "post" do
      assert_select "select#contribution_account_id[name=?]", "contribution[account_id]"
      assert_select "select#contribution_contribution_type_id[name=?]", "contribution[contribution_type_id]"
      assert_select "select#contribution_member_id[name=?]", "contribution[member_id]"
      assert_select "input#contribution_amount[name=?]", "contribution[amount]"
    end
  end
end
