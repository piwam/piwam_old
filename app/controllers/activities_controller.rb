class ActivitiesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @activity.save
      redirect_to activities_url
    else
      render :new
    end
  end

  def update
    if @activity.update(update_params)
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
    
    def create_params
      activity_params.merge(created_by: @current_member.id)
    end

    def update_params
      activity_params.merge(updated_by: @current_member.id)
    end

    def activity_params
      params.require(:activity).permit(:label)
    end
    
end
