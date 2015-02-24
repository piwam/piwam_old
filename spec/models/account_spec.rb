require 'rails_helper'

describe Account do
  it "has a valid factory" do
    expect(FactoryGirl.create(:account)).to be_valid
  end

  it "is invalid without a label" do
    expect(FactoryGirl.build(:account, label: nil)).not_to be_valid
  end

  it "is invalid without a reference" do
    expect(FactoryGirl.build(:account, reference: nil)).not_to be_valid
  end

  it "does not allow duplicate references" do
    account = FactoryGirl.create(:account, reference: 'CAISSE_MONNAIE')
    expect(FactoryGirl.build(:account, reference: 'CAISSE_MONNAIE')).not_to be_valid
  end

  it "returns the reference of the account as a string" do
    account = FactoryGirl.create(:account, reference: 'CAISSE_MONNAIE')
    expect(account.to_s).to eq('CAISSE_MONNAIE')
  end
end
