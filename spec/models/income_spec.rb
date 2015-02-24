require 'rails_helper'

describe Income do
  it "has a valid factory" do
    expect(FactoryGirl.create(:income)).to be_valid
  end

  it "is invalid without a label" do
    expect(FactoryGirl.build(:income, label: nil)).not_to be_valid
  end

  it "is invalid without an amount" do
    expect(FactoryGirl.build(:income, amount: nil)).not_to be_valid
  end

  it "is invalid without an account" do
    expect(FactoryGirl.build(:income, account_id: nil)).not_to be_valid
  end

  it "is invalid without an activity" do
    expect(FactoryGirl.build(:income, activity_id: nil)).not_to be_valid
  end

  it "is invalid without a date" do
    expect(FactoryGirl.build(:income, date: nil)).not_to be_valid
  end

  it "is invalid with a negative amount" do
    expect(FactoryGirl.build(:income, amount: -1)).not_to be_valid
  end
end
