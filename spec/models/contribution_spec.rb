require 'rails_helper'

describe Contribution do
  it "has a valid factory" do
    expect(FactoryGirl.create(:contribution)).to be_valid
  end

  it "is invalid without an account" do
    expect(FactoryGirl.build(:contribution, account_id: nil)).not_to be_valid
  end

  it "is invalid without a type" do
    expect(FactoryGirl.build(:contribution, contribution_type_id: nil)).not_to be_valid
  end

  it "is invalid without a member" do
    expect(FactoryGirl.build(:contribution, member_id: nil)).not_to be_valid
  end

  it "is invalid without a date" do
    expect(FactoryGirl.build(:contribution, date: nil)).not_to be_valid
  end

  it "is invalid without an amount" do
    expect(FactoryGirl.build(:contribution, amount: nil)).not_to be_valid
  end
end
