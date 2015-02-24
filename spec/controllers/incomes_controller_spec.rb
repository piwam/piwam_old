require 'rails_helper'

describe IncomesController do

  let(:member) { FactoryGirl.create(:member) }
  let(:account) { FactoryGirl.create(:account) }
  let(:activity) { FactoryGirl.create(:activity) }
  let(:valid_attributes) { { label: 'Ventes de biens', amount: 212.45, account_id: account.id, activity_id: activity.id, date: '2015-02-24' } }
  let(:invalid_attributes) { { label: nil } }
  let(:valid_session) { { member_id: member.id } }

  describe "GET #index" do
    it "assigns all incomes as @incomes" do
      income = Income.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:incomes)).to eq([income])
    end
  end

  describe "GET #show" do
    it "assigns the requested income as @income" do
      income = Income.create! valid_attributes
      get :show, {:id => income.to_param}, valid_session
      expect(assigns(:income)).to eq(income)
    end
  end

  describe "GET #new" do
    it "assigns a new income as @income" do
      get :new, {}, valid_session
      expect(assigns(:income)).to be_a_new(Income)
    end
  end

  describe "GET #edit" do
    it "assigns the requested income as @income" do
      income = Income.create! valid_attributes
      get :edit, {:id => income.to_param}, valid_session
      expect(assigns(:income)).to eq(income)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Income" do
        expect {
          post :create, {:income => valid_attributes}, valid_session
        }.to change(Income, :count).by(1)
      end

      it "assigns a newly created income as @income" do
        post :create, {:income => valid_attributes}, valid_session
        expect(assigns(:income)).to be_a(Income)
        expect(assigns(:income)).to be_persisted
      end

      it "redirects to the created income" do
        post :create, {:income => valid_attributes}, valid_session
        expect(response).to redirect_to(Income.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved income as @income" do
        post :create, {:income => invalid_attributes}, valid_session
        expect(assigns(:income)).to be_a_new(Income)
      end

      it "re-renders the 'new' template" do
        post :create, {:income => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { label: 'Ventes diverses' } }

      it "updates the requested income" do
        income = Income.create! valid_attributes
        put :update, {:id => income.to_param, :income => new_attributes}, valid_session
        income.reload
        expect(income.label).to eq('Ventes diverses')
      end

      it "assigns the requested income as @income" do
        income = Income.create! valid_attributes
        put :update, {:id => income.to_param, :income => valid_attributes}, valid_session
        expect(assigns(:income)).to eq(income)
      end

      it "redirects to the income" do
        income = Income.create! valid_attributes
        put :update, {:id => income.to_param, :income => valid_attributes}, valid_session
        expect(response).to redirect_to(income)
      end
    end

    context "with invalid params" do
      it "assigns the income as @income" do
        income = Income.create! valid_attributes
        put :update, {:id => income.to_param, :income => invalid_attributes}, valid_session
        expect(assigns(:income)).to eq(income)
      end

      it "re-renders the 'edit' template" do
        income = Income.create! valid_attributes
        put :update, {:id => income.to_param, :income => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested income" do
      income = Income.create! valid_attributes
      expect {
        delete :destroy, {:id => income.to_param}, valid_session
      }.to change(Income, :count).by(-1)
    end

    it "redirects to the incomes list" do
      income = Income.create! valid_attributes
      delete :destroy, {:id => income.to_param}, valid_session
      expect(response).to redirect_to(incomes_url)
    end
  end

end
