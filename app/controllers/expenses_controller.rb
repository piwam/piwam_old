class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html {
        @expenses = Expense.includes(:account, :activity)
        @expenses = @expenses.page(params[:page]).per(Setting.items_per_page)
      }
      format.csv { send_data Expense.to_csv }
    end
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to @expense
    else
      render :new
    end
  end

  def update
    if @expense.update(expense_params)
      redirect_to @expense
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_url
  end

  private
    
    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:label, :amount, :account_id, :activity_id, :date, :paid)
    end

end
