require 'rails_helper'

describe ContributionsController do

  let(:member) { FactoryGirl.create(:member) }
  let(:account) { FactoryGirl.create(:account) }
  let(:contribution_type) { FactoryGirl.create(:contribution_type) }
  let(:valid_attributes) { { account_id: account.id, contribution_type_id: contribution_type.id, member_id: member.id, date: '2015-02-18', amount: 9.99 } }
  let(:invalid_attributes) { { account_id: nil } }
  let(:valid_session) { { member_id: member.id } }

  describe "GET #index" do
    it "assigns all contributions as @contributions" do
      contribution = Contribution.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:contributions)).to eq([contribution])
    end
  end

  describe "GET #new" do
    it "assigns a new contribution as @contribution" do
      get :new, {}, valid_session
      expect(assigns(:contribution)).to be_a_new(Contribution)
    end
  end

  describe "GET #edit" do
    it "assigns the requested contribution as @contribution" do
      contribution = Contribution.create! valid_attributes
      get :edit, {:id => contribution.to_param}, valid_session
      expect(assigns(:contribution)).to eq(contribution)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Contribution" do
        expect {
          post :create, {:contribution => valid_attributes}, valid_session
        }.to change(Contribution, :count).by(1)
      end

      it "assigns a newly created contribution as @contribution" do
        post :create, {:contribution => valid_attributes}, valid_session
        expect(assigns(:contribution)).to be_a(Contribution)
        expect(assigns(:contribution)).to be_persisted
      end

      it "redirects to the contributions list" do
        post :create, {:contribution => valid_attributes}, valid_session
        expect(response).to redirect_to(contributions_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contribution as @contribution" do
        post :create, {:contribution => invalid_attributes}, valid_session
        expect(assigns(:contribution)).to be_a_new(Contribution)
      end

      it "re-renders the 'new' template" do
        post :create, {:contribution => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { amount: 45.0 } }

      it "updates the requested contribution" do
        contribution = Contribution.create! valid_attributes
        put :update, {:id => contribution.to_param, :contribution => new_attributes}, valid_session
        contribution.reload
        expect(contribution.amount).to eq(45.0)
      end

      it "assigns the requested contribution as @contribution" do
        contribution = Contribution.create! valid_attributes
        put :update, {:id => contribution.to_param, :contribution => valid_attributes}, valid_session
        expect(assigns(:contribution)).to eq(contribution)
      end

      it "redirects to the contributions list" do
        contribution = Contribution.create! valid_attributes
        put :update, {:id => contribution.to_param, :contribution => valid_attributes}, valid_session
        expect(response).to redirect_to(contributions_url)
      end
    end

    context "with invalid params" do
      it "assigns the contribution as @contribution" do
        contribution = Contribution.create! valid_attributes
        put :update, {:id => contribution.to_param, :contribution => invalid_attributes}, valid_session
        expect(assigns(:contribution)).to eq(contribution)
      end

      it "re-renders the 'edit' template" do
        contribution = Contribution.create! valid_attributes
        put :update, {:id => contribution.to_param, :contribution => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested contribution" do
      contribution = Contribution.create! valid_attributes
      expect {
        delete :destroy, {:id => contribution.to_param}, valid_session
      }.to change(Contribution, :count).by(-1)
    end

    it "redirects to the contributions list" do
      contribution = Contribution.create! valid_attributes
      delete :destroy, {:id => contribution.to_param}, valid_session
      expect(response).to redirect_to(contributions_url)
    end
  end

end
