require 'rails_helper'

describe Activity do
  it "has a valid factory" do
    expect(FactoryGirl.create(:activity)).to be_valid
  end

  it "is invalid without a label" do
    expect(FactoryGirl.build(:activity, label: nil)).not_to be_valid
  end

  it "does not allow duplicate label" do
    activity = FactoryGirl.create(:activity, label: "Fonctionnement général de l'association")
    expect(FactoryGirl.build(:activity, label: "Fonctionnement général de l'association")).not_to be_valid
  end
end
