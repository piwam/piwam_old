class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_member

  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end

  private

    def authenticate_member
      if current_member.nil?
        redirect_to Member.any? ? login_url : setup_url
      end
    end

end
