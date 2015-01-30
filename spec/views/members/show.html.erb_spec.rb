require 'rails_helper'

describe "members/show" do
  before(:each) do
    @member = assign(:member, FactoryGirl.create(:member,
      last_name:  'Doe',
      first_name: 'John'
    ))
  end

  it "renders attributes in <td>" do
    render
    expect(rendered).to match(/Doe/)
    expect(rendered).to match(/John/)
  end
end
