require 'rails_helper'

describe "members/new" do
  before(:each) do
    assign(:member, Member.new)
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do
      assert_select "input#member_last_name[name=?]", "member[last_name]"
      assert_select "input#member_first_name[name=?]", "member[first_name]"
      assert_select "input#member_email[name=?]", "member[email]"
      assert_select "input#member_password[name=?]", "member[password]"
      assert_select "input#member_status_id[name=?]", "member[status_id]"
      assert_select "input#member_registered_on[name=?]", "member[registered_on]"
      assert_select "input#member_exempt_of_contributions[name=?]", "member[exempt_of_contributions]"
      assert_select "input#member_street[name=?]", "member[street]"
      assert_select "input#member_postal_code[name=?]", "member[postal_code]"
      assert_select "input#member_city[name=?]", "member[city]"
      assert_select "select#member_country[name=?]", "member[country]"
      assert_select "input#member_website[name=?]", "member[website]"
      assert_select "input#member_phone_number[name=?]", "member[phone_number]"
      assert_select "input#member_mobile_number[name=?]", "member[mobile_number]"
    end
  end
end
