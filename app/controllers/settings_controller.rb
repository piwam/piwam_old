class SettingsController < ApplicationController
  authorize_resource

  def index
  end

  def update
    Setting.update_list settings_params
    redirect_to settings_path, notice: 'Les préférences ont bien été prises en compte.'
  end

  private

    def settings_params
      params.require(:settings).permit(:items_per_page, :region, :currency, :sender_address, :smtp_host, :smtp_user, :smtp_password)
    end

end