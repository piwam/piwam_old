require 'rails_helper'

describe "incomes/edit" do
  before(:each) do
    @income = assign(:income, FactoryGirl.create(:income))
  end

  it "renders the edit income form" do
    render

    assert_select "form[action=?][method=?]", income_path(@income), "post" do
      assert_select "input#income_label[name=?]", "income[label]"
      assert_select "input#income_amount[name=?]", "income[amount]"
      assert_select "select#income_account_id[name=?]", "income[account_id]"
      assert_select "select#income_activity_id[name=?]", "income[activity_id]"
      assert_select "input#income_received[name=?]", "income[received]"
    end
  end
end
