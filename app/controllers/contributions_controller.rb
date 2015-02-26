class ContributionsController < ApplicationController
  load_and_authorize_resource

  def index
    @contributions = @contributions.includes(:account, :contribution_type, :member)
    @contributions = @contributions.page(params[:page]).per(Setting.items_per_page)
  end

  def new
  end

  def edit
  end

  def create
    if @contribution.save
      redirect_to contributions_url
    else
      render :new
    end
  end

  def update
    if @contribution.update(update_params)
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

    def create_params
      contribution_params.merge(created_by: @current_member.id)
    end

    def update_params
      contribution_params.merge(updated_by: @current_member.id)
    end

    def contribution_params
      params.require(:contribution).permit(:account_id, :contribution_type_id, :member_id, :date, :amount)
    end
    
end
