class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = Activity.all
  end

  def show
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params.merge(created_by: @current_member.id, updated_by: @current_member.id))

    if @activity.save
      redirect_to activities_url
    else
      render :new
    end
  end

  def update
    if @activity.update(activity_params.merge(updated_by: @current_member.id))
      redirect_to activities_url
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_url
  end

  private
    
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:label)
    end
    
end
