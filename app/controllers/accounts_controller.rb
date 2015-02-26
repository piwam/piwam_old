class AccountsController < ApplicationController
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
    if @account.save
      redirect_to @account
    else
      render :new
    end
  end

  def update
    if @account.update(update_params)
      redirect_to @account
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_url
  end

  private
  
    def create_params
      account_params.merge(created_by: @current_member.id)
    end

    def update_params
      account_params.merge(updated_by: @current_member.id)
    end

    def account_params
      params.require(:account).permit(:label, :reference, :active)
    end

end
