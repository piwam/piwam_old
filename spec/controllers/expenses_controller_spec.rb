require 'rails_helper'

describe ExpensesController do

  let(:member) { FactoryGirl.create(:member) }
  let(:account) { FactoryGirl.create(:account) }
  let(:activity) { FactoryGirl.create(:activity) }
  let(:valid_attributes) { { label: 'Achats divers', amount: 34.50, account_id: account.id, activity_id: activity.id, date: '2015-02-24' } }
  let(:invalid_attributes) { { label: nil } }
  let(:valid_session) { { member_id: member.id } }

  describe "GET #index" do
    it "assigns all expenses as @expenses" do
      expense = Expense.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:expenses)).to eq([expense])
    end
  end

  describe "GET #show" do
    it "assigns the requested expense as @expense" do
      expense = Expense.create! valid_attributes
      get :show, {:id => expense.to_param}, valid_session
      expect(assigns(:expense)).to eq(expense)
    end
  end

  describe "GET #new" do
    it "assigns a new expense as @expense" do
      get :new, {}, valid_session
      expect(assigns(:expense)).to be_a_new(Expense)
    end
  end

  describe "GET #edit" do
    it "assigns the requested expense as @expense" do
      expense = Expense.create! valid_attributes
      get :edit, {:id => expense.to_param}, valid_session
      expect(assigns(:expense)).to eq(expense)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Expense" do
        expect {
          post :create, {:expense => valid_attributes}, valid_session
        }.to change(Expense, :count).by(1)
      end

      it "assigns a newly created expense as @expense" do
        post :create, {:expense => valid_attributes}, valid_session
        expect(assigns(:expense)).to be_a(Expense)
        expect(assigns(:expense)).to be_persisted
      end

      it "redirects to the created expense" do
        post :create, {:expense => valid_attributes}, valid_session
        expect(response).to redirect_to(Expense.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved expense as @expense" do
        post :create, {:expense => invalid_attributes}, valid_session
        expect(assigns(:expense)).to be_a_new(Expense)
      end

      it "re-renders the 'new' template" do
        post :create, {:expense => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { label: 'Impôts' } }

      it "updates the requested expense" do
        expense = Expense.create! valid_attributes
        put :update, {:id => expense.to_param, :expense => new_attributes}, valid_session
        expense.reload
        expect(expense.label).to eq('Impôts')
      end

      it "assigns the requested expense as @expense" do
        expense = Expense.create! valid_attributes
        put :update, {:id => expense.to_param, :expense => valid_attributes}, valid_session
        expect(assigns(:expense)).to eq(expense)
      end

      it "redirects to the expense" do
        expense = Expense.create! valid_attributes
        put :update, {:id => expense.to_param, :expense => valid_attributes}, valid_session
        expect(response).to redirect_to(expense)
      end
    end

    context "with invalid params" do
      it "assigns the expense as @expense" do
        expense = Expense.create! valid_attributes
        put :update, {:id => expense.to_param, :expense => invalid_attributes}, valid_session
        expect(assigns(:expense)).to eq(expense)
      end

      it "re-renders the 'edit' template" do
        expense = Expense.create! valid_attributes
        put :update, {:id => expense.to_param, :expense => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested expense" do
      expense = Expense.create! valid_attributes
      expect {
        delete :destroy, {:id => expense.to_param}, valid_session
      }.to change(Expense, :count).by(-1)
    end

    it "redirects to the expenses list" do
      expense = Expense.create! valid_attributes
      delete :destroy, {:id => expense.to_param}, valid_session
      expect(response).to redirect_to(expenses_url)
    end
  end

end
