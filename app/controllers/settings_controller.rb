class SettingsController < ApplicationController

  def index
  end

  def association
  end

  def update
    settings_params.each do |var, value|
      Settings[var] = value
    end
    
    redirect_to :back, notice: 'Les préférences ont bien été prises en compte.'
  end

  private

    def settings_params
      params.require(:settings).permit(:items_per_page, :region, :sender_address, :google_map_api_key, :association_name, :association_description, :association_website)
    end

end