class ContributionTypesController < ApplicationController
  before_action :set_contribution_type, only: [:edit, :update, :destroy]

  def index
    @contribution_types = ContributionType.all
  end

  def new
    @contribution_type = ContributionType.new
  end

  def edit
  end

  def create
    @contribution_type = ContributionType.new(contribution_type_params.merge(created_by: @current_member.id, updated_by: @current_member.id))

    if @contribution_type.save
      redirect_to contribution_types_url
    else
      render :new
    end
  end

  def update
    if @contribution_type.update(contribution_type_params.merge(updated_by: @current_member.id))
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
    
    def set_contribution_type
      @contribution_type = ContributionType.find(params[:id])
    end

    def contribution_type_params
      params.require(:contribution_type).permit(:label, :expires_on, :amount, :active)
    end
    
end
