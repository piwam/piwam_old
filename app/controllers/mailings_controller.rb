class MailingsController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    @mailing.from = Setting.sender_address if @mailing.from.blank?
    @mailing.to = Member.where.not(email: nil).pluck(:email) if @mailing.to.blank?

    if @mailing.save
      MemberMailer.mailing(@mailing.id).deliver_now
      redirect_to new_mailing_path, notice: "L'email a été envoyé."
    else
      render :new
    end
  end

  private
  
    def mailing_params
      params.require(:mailing).permit(:from, :to, :subject, :body).merge(created_by: @current_member.id)
    end

end