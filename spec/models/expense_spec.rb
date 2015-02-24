require 'rails_helper'

describe Expense do
  it "has a valid factory" do
    expect(FactoryGirl.create(:expense)).to be_valid
  end

  it "is invalid without a label" do
    expect(FactoryGirl.build(:expense, label: nil)).not_to be_valid
  end

  it "is invalid without an amount" do
    expect(FactoryGirl.build(:expense, amount: nil)).not_to be_valid
  end

  it "is invalid without an account" do
    expect(FactoryGirl.build(:expense, account_id: nil)).not_to be_valid
  end

  it "is invalid without an activity" do
    expect(FactoryGirl.build(:expense, activity_id: nil)).not_to be_valid
  end

  it "is invalid without a date" do
    expect(FactoryGirl.build(:expense, date: nil)).not_to be_valid
  end

  it "is invalid with a negative amount" do
    expect(FactoryGirl.build(:expense, amount: -1)).not_to be_valid
  end
end
