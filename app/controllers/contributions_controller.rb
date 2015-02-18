class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:edit, :update, :destroy]

  def index
    @contributions = Contribution.includes(:account, :contribution_type, :member)
    @contributions = @contributions.page(params[:page]).per(Setting.items_per_page)
  end

  def new
    @contribution = Contribution.new
  end

  def edit
  end

  def create
    @contribution = Contribution.new(contribution_params.merge(created_by: @current_member.id, updated_by: @current_member.id))

    if @contribution.save
      redirect_to contributions_url
    else
      render :new
    end
  end

  def update
    if @contribution.update(contribution_params.merge(updated_by: @current_member.id))
      redirect_to contributions_url
    else
      render :edit
    end
  end

  def destroy
    @contribution.destroy
    redirect_to contributions_url
  end

  private

    def set_contribution
      @contribution = Contribution.find(params[:id])
    end

    def contribution_params
      params.require(:contribution).permit(:account_id, :contribution_type_id, :member_id, :date, :amount)
    end
    
end
