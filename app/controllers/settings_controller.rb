class SettingsController < ApplicationController

  def index
  end

  def update
    Settings.items_per_page     = params[:items_per_page]
    Settings.sender_address     = params[:sender_address]
    Settings.google_map_api_key = params[:google_map_api_key]

    redirect_to settings_url, notice: 'Les préférences ont bien été prises en compte.'
  end

end