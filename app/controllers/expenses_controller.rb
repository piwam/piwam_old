class ExpensesController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html {
        @expenses = @expenses.includes(:account, :activity)
        @expenses = @expenses.page(params[:page]).per(Setting.items_per_page)
      }
      format.csv { send_data Expense.to_csv }
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @expense.save
      redirect_to @expense
    else
      render :new
    end
  end

  def update
    if @expense.update(update_params)
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
    
    def create_params
      expense_params.merge(created_by: @current_member.id)
    end

    def update_params
      expense_params.merge(updated_by: @current_member.id)
    end

    def expense_params
      params.require(:expense).permit(:label, :amount, :account_id, :activity_id, :date, :paid)
    end

end
