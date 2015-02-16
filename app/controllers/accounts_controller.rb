class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params.merge(created_by: @current_member.id, updated_by: @current_member.id))

    if @account.save
      redirect_to @account
    else
      render :new
    end
  end

  def update
    if @account.update(account_params.merge(updated_by: @current_member.id))
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
  
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:label, :reference, :active)
    end

end
