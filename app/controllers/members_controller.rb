class MembersController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html {
        @q = Member.includes(:status).ransack(params[:q])
        @members = @q.result.page(params[:page]).per(Setting.items_per_page)
      }
      format.csv { send_data Member.to_csv }
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @member.save
      redirect_to @member
    else
      render :new
    end
  end

  def update
    if @member.update(update_params)
      redirect_to members_url
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url
  end

  def faces
    @members = @members.page(params[:page]).per(Setting.items_per_page)
  end

  def map
    @members = @members.geocoded
    @hash = Gmaps4rails.build_markers(@members) do |member, marker|
      marker.lat member.latitude
      marker.lng member.longitude
      marker.infowindow member.to_s
    end
  end

  private
  
    def create_params
      member_params.merge(created_by: @current_member.id)
    end

    def update_params
      member_params.merge(updated_by: @current_member.id)
    end

    def member_params
      params.require(:member).permit(:last_name, :first_name, :email, :password, :status_id, :photo, :registered_on, :exempt_of_contributions, :street, :postal_code, :city, :country, :website, :phone_number, :mobile_number)
    end

end
