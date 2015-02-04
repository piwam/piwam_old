class SettingsController < ApplicationController

  def index
  end

  def update
    settings_params.each do |var, value|
      Settings[var] = value
    end

    redirect_to settings_url, notice: 'Les préférences ont bien été prises en compte.'
  end

  private

    def settings_params
      params.require(:settings).permit(:items_per_page, :sender_address, :google_map_api_key)
    end

end