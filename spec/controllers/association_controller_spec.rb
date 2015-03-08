require 'rails_helper'

describe AssociationController do

  describe "POST update" do

    let(:member) { FactoryGirl.create(:member) }
    let(:valid_session) { { member_id: member.id } }

    it "updates valid settings" do
      post :update, { association: { association_name: 15 } }, valid_session
      expect(Setting.association_name).to eq('15')
    end

    it "does not update invalid settings" do
      post :update, { association: { unknown_setting: 'Foo' } }, valid_session
      expect(Setting.unknown_setting).to be_nil
    end
  end

end
