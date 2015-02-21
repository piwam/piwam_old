require 'rails_helper'

describe Member do
  it "has a valid factory" do
    expect(FactoryGirl.create(:member)).to be_valid
  end

  it "is invalid without a last name" do
    expect(FactoryGirl.build(:member, last_name: nil)).not_to be_valid
  end

  it "is invalid without a first name" do
    expect(FactoryGirl.build(:member, first_name: nil)).not_to be_valid
  end

  it "is invalid without an email if alone" do
    expect(FactoryGirl.build(:member, email: nil)).not_to be_valid
    FactoryGirl.create(:member)
    expect(FactoryGirl.build(:member, email: nil)).to be_valid
  end

  it "is invalid with an email in incorrect format" do
    expect(FactoryGirl.build(:member, email: 'foo@bar')).not_to be_valid
  end

  it "does not allow duplicate emails" do
    member = FactoryGirl.create(:member, email: 'john@example.com')
    expect(FactoryGirl.build(:member, email: member.email)).not_to be_valid
  end

  it "is invalid with a password too short" do
    password = 'short'
    expect(FactoryGirl.build(:member, password: password, password_confirmation: password)).not_to be_valid
  end

  it "is invalid with a password too long" do
    password = 'loooooooooonnnnnnnnnng'
    expect(FactoryGirl.build(:member, password: password, password_confirmation: password)).not_to be_valid
  end

  it "returns the member's full name as a string" do
    member = FactoryGirl.create(:member, first_name: 'John', last_name: 'Doe')
    expect(member.to_s).to eq('John Doe')
  end

  describe "#address" do
    let(:member) { FactoryGirl.create(:member, street: '1 Infinite Loop', postal_code: '95014', city: 'Cupertino', country: 'US') }

    it "returns the full address" do
      expect(member.address).to eq('1 Infinite Loop 95014 Cupertino États-Unis')
    end
  end

  describe "#country_name" do
    let(:member) { FactoryGirl.create(:member, country: 'FR') }

    it "returns the countryname as a string" do
      expect(member.country_name).to eq('France')
    end
  end

end
