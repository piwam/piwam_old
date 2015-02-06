require 'rails_helper'

describe SettingsController do

  describe "POST update" do

    let(:member) { FactoryGirl.create(:member) }
    let(:valid_session) { { member_id: member.id } }

    before(:each) do
      request.env["HTTP_REFERER"] = settings_path
    end

    it "updates valid settings" do
      post :update, { settings: { items_per_page: 15 } }, valid_session
      expect(Setting.items_per_page).to eq('15')
    end

    it "does not update invalid settings" do
      post :update, { settings: { unknown_setting: 'Foo' } }, valid_session
      expect(Setting.unknown_setting).to be_nil
    end
  end

end
