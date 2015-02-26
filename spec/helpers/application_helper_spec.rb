require 'rails_helper'

describe ApplicationHelper do
  let(:member) { FactoryGirl.create(:member, first_name: 'John', last_name: 'Doe') }

  describe "#creator" do
    it "returns the name of the creator if present" do
      account = FactoryGirl.create(:account, created_at: '2015-02-26 14:10', created_by: member.id)
      expect(helper.creator(account)).to eq("26/02/2015 14:10 par <a href=\"/members/#{member.id}\">John Doe</a>")
    end

    it "returns 'System' if the creator is not present" do
      account = FactoryGirl.create(:account, created_at: '2015-02-26 14:10', created_by: nil)
      expect(helper.creator(account)).to eq("26/02/2015 14:10 par <em>Système</em>")
    end
  end

  describe "#updater" do
    it "returns the name of the updater if present" do
      account = FactoryGirl.create(:account, updated_at: '2015-02-26 14:10', updated_by: member.id)
      expect(helper.updater(account)).to eq("26/02/2015 14:10 par <a href=\"/members/#{member.id}\">John Doe</a>")
    end

    it "returns 'Never updated' if the updater is not present" do
      account = FactoryGirl.create(:account, updated_at: '2015-02-26 14:10', updated_by: nil)
      expect(helper.updater(account)).to eq("<em>Aucune mise à jour pour le moment</em>")
    end
  end
end