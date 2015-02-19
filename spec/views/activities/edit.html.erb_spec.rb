require 'rails_helper'

describe "activities/edit" do
  before(:each) do
    @activity = assign(:activity, FactoryGirl.create(:activity))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do
      assert_select "input#activity_label[name=?]", "activity[label]"
    end
  end
end
