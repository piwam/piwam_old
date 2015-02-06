class SetupController < ApplicationController
  skip_before_action :authenticate_member, only: [:new, :create]
  before_action :check_members

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      session[:member_id] = @member.id
      redirect_to association_url
    else
      render :new
    end
  end

  private

    def check_members
      redirect_to root_url if Member.any?
    end

    def member_params
      params.require(:member).permit(:last_name, :first_name, :email, :password)
    end

end