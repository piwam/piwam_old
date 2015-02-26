class IncomesController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html {
        @incomes = @incomes.includes(:account, :activity)
        @incomes = @incomes.page(params[:page]).per(Setting.items_per_page)
      }
      format.csv { send_data Income.to_csv }
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @income.save
      redirect_to @income
    else
      render :new
    end
  end

  def update
    if @income.update(update_params)
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
    
    def create_params
      income_params.merge(created_by: @current_member.id)
    end

    def update_params
      income_params.merge(updated_by: @current_member.id)
    end

    def income_params
      params.require(:income).permit(:label, :amount, :account_id, :activity_id, :date, :received)
    end

end
