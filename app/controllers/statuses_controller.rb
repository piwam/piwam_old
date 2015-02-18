class StatusesController < ApplicationController
  before_action :set_status, only: [:edit, :update, :destroy]

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def edit
  end

  def create
    @status = Status.new(status_params.merge(created_by: @current_member.id, updated_by: @current_member.id))

    if @status.save
      redirect_to statuses_url
    else
      render :new
    end
  end

  def update
    if @status.update(status_params.merge(updated_by: @current_member.id))
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
    
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
      params.require(:status).permit(:label)
    end
    
end
