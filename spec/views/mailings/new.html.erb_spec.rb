require 'rails_helper'

describe "mailings/new" do
  before(:each) do
    assign(:mailing, Mailing.new)
  end

  it "renders new mailing form" do
    render

    assert_select "form[action=?][method=?]", mailings_path, "post" do
      assert_select "input#mailing_subject[name=?]", "mailing[subject]"
      assert_select "textarea#mailing_body[name=?]", "mailing[body]"
    end
  end
end
