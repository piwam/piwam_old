class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.page(params[:page]).per(Settings.items_per_page)
  end

  def show
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to @member
    else
      render :new
    end
  end

  def update
    if @member.update(member_params)
      redirect_to members_url
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url
  end

  private
  
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:last_name, :first_name, :email, :password, :status_id, :registered_on, :exempt_of_contributions, :street, :postal_code, :city, :country, :website, :phone_number, :mobile_number)
    end

end
