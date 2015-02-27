require 'rails_helper'

describe Permission do
  it "has a valid factory" do
    expect(FactoryGirl.create(:permission)).to be_valid
  end

  it "is invalid without a member" do
    expect(FactoryGirl.build(:permission, member_id: nil)).not_to be_valid
  end

  it "is invalid without an action" do
    expect(FactoryGirl.build(:permission, action: nil)).not_to be_valid
  end

  it "is invalid without a controller" do
    expect(FactoryGirl.build(:permission, controller: nil)).not_to be_valid
  end
end
