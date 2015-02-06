require 'rails_helper'

describe "sessions/new" do
  it "renders login form" do
    render

    assert_select "form[action=?][method=?]", login_path, "post" do
      assert_select "input#email[name=?]", "email"
      assert_select "input#password[name=?]", "password"
    end
  end
end