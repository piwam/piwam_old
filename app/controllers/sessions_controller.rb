class SessionsController < ApplicationController
  skip_before_action :authenticate_member, only: [:new, :create, :destroy]

  def new
  end

  def create
    member = Member.authenticatable.find_by(email: params[:email])
    if member && member.authenticate(params[:password])
      session[:member_id] = member.id
      redirect_to root_url
    else
      flash.now.alert = "Email ou mot de passe invalide"
      render 'new'
    end
  end

  def destroy
    session[:member_id] = nil
    redirect_to login_url
  end

end