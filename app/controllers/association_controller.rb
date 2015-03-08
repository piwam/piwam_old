class AssociationController < ApplicationController
  authorize_resource

  def index
  end

  def update
    Setting.update_list association_params
    redirect_to association_path, notice: 'Les modifications ont bien été prises en compte.'
  end

  private

    def association_params
      params.require(:association).permit(:association_name, :association_description, :association_website)
    end

end