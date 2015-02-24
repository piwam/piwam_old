require 'rails_helper'

describe "incomes/new" do
  before(:each) do
    assign(:income, Income.new)
  end

  it "renders new income form" do
    render

    assert_select "form[action=?][method=?]", incomes_path, "post" do
      assert_select "input#income_label[name=?]", "income[label]"
      assert_select "input#income_amount[name=?]", "income[amount]"
      assert_select "select#income_account_id[name=?]", "income[account_id]"
      assert_select "select#income_activity_id[name=?]", "income[activity_id]"
      assert_select "input#income_received[name=?]", "income[received]"
    end
  end
end
