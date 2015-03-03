require 'rails_helper'

describe Mailing do
  it "has a valid factory" do
    expect(FactoryGirl.create(:mailing)).to be_valid
  end

  it "is invalid without a sender address" do
    expect(FactoryGirl.build(:mailing, from: nil)).not_to be_valid
  end

  it "is invalid without a recipient" do
    expect(FactoryGirl.build(:mailing, to: nil)).not_to be_valid
  end

  it "is invalid without a subject" do
    expect(FactoryGirl.build(:mailing, subject: nil)).not_to be_valid
  end

  it "is invalid without a content" do
    expect(FactoryGirl.build(:mailing, body: nil)).not_to be_valid
  end
end
