require 'rails_helper'

describe Status do
  it "has a valid factory" do
    expect(FactoryGirl.create(:status)).to be_valid
  end

  it "is invalid without a label" do
    expect(FactoryGirl.build(:status, label: nil)).not_to be_valid
  end

  it "does not allow duplicate label" do
    status = FactoryGirl.create(:status, label: 'Président')
    expect(FactoryGirl.build(:status, label: 'Président')).not_to be_valid
  end

  it "returns the label of the status as a string" do
    status = FactoryGirl.create(:status, label: 'Président')
    expect(status.to_s).to eq('Président')
  end
end
