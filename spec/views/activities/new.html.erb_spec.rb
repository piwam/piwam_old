require 'rails_helper'

describe "activities/new" do
  before(:each) do
    assign(:activity, Activity.new)
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do
      assert_select "input#activity_label[name=?]", "activity[label]"
    end
  end
end
