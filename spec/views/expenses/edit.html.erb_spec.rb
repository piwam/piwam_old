require 'rails_helper'

describe "expenses/edit" do
  before(:each) do
    @expense = assign(:expense, FactoryGirl.create(:expense))
  end

  it "renders the edit expense form" do
    render

    assert_select "form[action=?][method=?]", expense_path(@expense), "post" do
      assert_select "input#expense_label[name=?]", "expense[label]"
      assert_select "input#expense_amount[name=?]", "expense[amount]"
      assert_select "select#expense_account_id[name=?]", "expense[account_id]"
      assert_select "select#expense_activity_id[name=?]", "expense[activity_id]"
      assert_select "input#expense_paid[name=?]", "expense[paid]"
    end
  end
end
