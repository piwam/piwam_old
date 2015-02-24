require 'rails_helper'

describe "expenses/new" do
  before(:each) do
    assign(:expense, Expense.new)
  end

  it "renders new expense form" do
    render

    assert_select "form[action=?][method=?]", expenses_path, "post" do
      assert_select "input#expense_label[name=?]", "expense[label]"
      assert_select "input#expense_amount[name=?]", "expense[amount]"
      assert_select "select#expense_account_id[name=?]", "expense[account_id]"
      assert_select "select#expense_activity_id[name=?]", "expense[activity_id]"
      assert_select "input#expense_paid[name=?]", "expense[paid]"
    end
  end
end
