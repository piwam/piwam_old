class StatusesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def edit
  end

  def create
    if @status.save
      redirect_to statuses_url
    else
      render :new
    end
  end

  def update
    if @status.update(update_params)
      redirect_to statuses_url
    else
      render :edit
    end
  end

  def destroy
    @status.destroy
    redirect_to statuses_url
  end

  private
    
    def create_params
      status_params.merge(created_by: @current_member.id)
    end

    def update_params
      status_params.merge(updated_by: @current_member.id)
    end

    def status_params
      params.require(:status).permit(:label)
    end
    
end
