require 'rails_helper'

describe "accounts/edit" do
  before(:each) do
    @account = assign(:account, FactoryGirl.create(:account))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do
      assert_select "input#account_label[name=?]", "account[label]"
      assert_select "input#account_reference[name=?]", "account[reference]"
    end
  end
end
