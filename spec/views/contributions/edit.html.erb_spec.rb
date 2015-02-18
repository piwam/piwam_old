require 'rails_helper'

RSpec.describe "contributions/edit", type: :view do
  before(:each) do
    @contribution = assign(:contribution, FactoryGirl.create(:contribution))
  end

  it "renders the edit contribution form" do
    render

    assert_select "form[action=?][method=?]", contribution_path(@contribution), "post" do
      assert_select "select#contribution_account_id[name=?]", "contribution[account_id]"
      assert_select "select#contribution_contribution_type_id[name=?]", "contribution[contribution_type_id]"
      assert_select "select#contribution_member_id[name=?]", "contribution[member_id]"
      assert_select "input#contribution_amount[name=?]", "contribution[amount]"
    end
  end
end
