class ContributionTypesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def edit
  end

  def create
    if @contribution_type.save
      redirect_to contribution_types_url
    else
      render :new
    end
  end

  def update
    if @contribution_type.update(update_params)
      redirect_to contribution_types_url
    else
      render :edit
    end
  end

  def destroy
    @contribution_type.destroy
    redirect_to contribution_types_url
  end

  private
    
    def create_params
      contribution_type_params.merge(created_by: @current_member.id)
    end

    def update_params
      contribution_type_params.merge(updated_by: @current_member.id)
    end

    def contribution_type_params
      params.require(:contribution_type).permit(:label, :expires_on, :amount, :active)
    end
    
end
