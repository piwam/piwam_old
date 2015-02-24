class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @q = Member.ransack(params[:q])
    @members = @q.result.page(params[:page]).per(Setting.items_per_page)
  end

  def show
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def create
    @member = Member.new(member_params.merge(created_by: @current_member.id, updated_by: @current_member.id))

    if @member.save
      redirect_to @member
    else
      render :new
    end
  end

  def update
    if @member.update(member_params.merge(updated_by: @current_member.id))
      redirect_to members_url
    else
      render :edit
    end
  end

  def destroy
    session[:member_id] = nil if @member.id == @current_member.id
    @member.destroy
    redirect_to members_url
  end

  def faces
    @members = Member.page(params[:page]).per(Setting.items_per_page)
  end

  def map
    @members = Member.geocoded
    @hash = Gmaps4rails.build_markers(@members) do |member, marker|
      marker.lat member.latitude
      marker.lng member.longitude
      marker.infowindow member.to_s
    end
  end

  private
  
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:last_name, :first_name, :email, :password, :status_id, :photo, :registered_on, :exempt_of_contributions, :street, :postal_code, :city, :country, :website, :phone_number, :mobile_number)
    end

end