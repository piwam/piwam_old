require 'rails_helper'

describe ContributionType do
  it "has a valid factory" do
    expect(FactoryGirl.create(:contribution_type)).to be_valid
  end

  it "is invalid without a label" do
    expect(FactoryGirl.build(:contribution_type, label: nil)).not_to be_valid
  end

  it "is invalid without an expiration date" do
    expect(FactoryGirl.build(:contribution_type, expires_on: nil)).not_to be_valid
  end

  it "is invalid without an amount" do
    expect(FactoryGirl.build(:contribution_type, amount: nil)).not_to be_valid
  end

  it "does not allow duplicate labels" do
    contribution_type = FactoryGirl.create(:contribution_type, label: 'Cotisation annuelle 2015')
    expect(FactoryGirl.build(:contribution_type, label: 'Cotisation annuelle 2015')).not_to be_valid
  end

  it "is invalid with a negative amount" do
    expect(FactoryGirl.build(:contribution_type, amount: -1)).not_to be_valid
  end
end
