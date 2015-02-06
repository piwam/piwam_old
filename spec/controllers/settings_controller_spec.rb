require 'rails_helper'

describe SettingsController do

  describe "POST update" do
    before(:each) do
      request.env["HTTP_REFERER"] = settings_path
    end

    it "updates valid settings" do
      post :update, { settings: { items_per_page: 15 } }
      expect(Setting.items_per_page).to eq('15')
    end

    it "does not update invalid settings" do
      post :update, { settings: { unknown_setting: 'Foo' } }
      expect(Setting.unknown_setting).to be_nil
    end
  end

end
