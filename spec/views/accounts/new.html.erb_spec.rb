require 'rails_helper'

describe "accounts/new" do
  before(:each) do
    assign(:account, Account.new)
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do
      assert_select "input#account_label[name=?]", "account[label]"
      assert_select "input#account_reference[name=?]", "account[reference]"
    end
  end
end
