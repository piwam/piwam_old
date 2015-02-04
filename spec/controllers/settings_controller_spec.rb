require 'rails_helper'

describe SettingsController do

  describe "POST update" do
    it "updates settings" do
      post :update, { items_per_page: 15 }
      expect(Settings.items_per_page).to eq('15')
    end
  end

end
