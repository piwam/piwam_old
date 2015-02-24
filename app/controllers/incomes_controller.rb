class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html {
        @incomes = Income.includes(:account, :activity)
        @incomes = @incomes.page(params[:page]).per(Setting.items_per_page)
      }
      format.csv { send_data Income.to_csv }
    end
  end

  def show
  end

  def new
    @income = Income.new
  end

  def edit
  end

  def create
    @income = Income.new(income_params.merge(created_by: @current_member.id, updated_by: @current_member.id))

    if @income.save
      redirect_to @income
    else
      render :new
    end
  end

  def update
    if @income.update(income_params.merge(updated_by: @current_member.id))
      redirect_to @income
    else
      render :edit
    end
  end

  def destroy
    @income.destroy
    redirect_to incomes_url
  end

  private
    
    def set_income
      @income = Income.find(params[:id])
    end

    def income_params
      params.require(:income).permit(:label, :amount, :account_id, :activity_id, :date, :received)
    end

end
