require 'rails_helper'

describe ContributionTypesController do

  let(:member) { FactoryGirl.create(:member) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:contribution_type) }
  let(:invalid_attributes) { { label: 'Cotisation annuelle 2015', expires_on: nil } }
  let(:valid_session) { { member_id: member.id } }

  describe "GET #index" do
    it "assigns all contribution_types as @contribution_types" do
      contribution_type = ContributionType.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:contribution_types)).to eq([contribution_type])
    end
  end

  describe "GET #new" do
    it "assigns a new contribution_type as @contribution_type" do
      get :new, {}, valid_session
      expect(assigns(:contribution_type)).to be_a_new(ContributionType)
    end
  end

  describe "GET #edit" do
    it "assigns the requested contribution_type as @contribution_type" do
      contribution_type = ContributionType.create! valid_attributes
      get :edit, {:id => contribution_type.to_param}, valid_session
      expect(assigns(:contribution_type)).to eq(contribution_type)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ContributionType" do
        expect {
          post :create, {:contribution_type => valid_attributes}, valid_session
        }.to change(ContributionType, :count).by(1)
      end

      it "assigns a newly created contribution_type as @contribution_type" do
        post :create, {:contribution_type => valid_attributes}, valid_session
        expect(assigns(:contribution_type)).to be_a(ContributionType)
        expect(assigns(:contribution_type)).to be_persisted
      end

      it "redirects to the created contribution_types list" do
        post :create, {:contribution_type => valid_attributes}, valid_session
        expect(response).to redirect_to(contribution_types_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contribution_type as @contribution_type" do
        post :create, {:contribution_type => invalid_attributes}, valid_session
        expect(assigns(:contribution_type)).to be_a_new(ContributionType)
      end

      it "re-renders the 'new' template" do
        post :create, {:contribution_type => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { label: 'Cotisation annuelle 2016' } }

      it "updates the requested contribution_type" do
        contribution_type = ContributionType.create! valid_attributes
        put :update, {:id => contribution_type.to_param, :contribution_type => new_attributes}, valid_session
        contribution_type.reload
        expect(contribution_type.label).to eq('Cotisation annuelle 2016')
      end

      it "assigns the requested contribution_type as @contribution_type" do
        contribution_type = ContributionType.create! valid_attributes
        put :update, {:id => contribution_type.to_param, :contribution_type => valid_attributes}, valid_session
        expect(assigns(:contribution_type)).to eq(contribution_type)
      end

      it "redirects to the contribution_types list" do
        contribution_type = ContributionType.create! valid_attributes
        put :update, {:id => contribution_type.to_param, :contribution_type => valid_attributes}, valid_session
        expect(response).to redirect_to(contribution_types_url)
      end
    end

    context "with invalid params" do
      it "assigns the contribution_type as @contribution_type" do
        contribution_type = ContributionType.create! valid_attributes
        put :update, {:id => contribution_type.to_param, :contribution_type => invalid_attributes}, valid_session
        expect(assigns(:contribution_type)).to eq(contribution_type)
      end

      it "re-renders the 'edit' template" do
        contribution_type = ContributionType.create! valid_attributes
        put :update, {:id => contribution_type.to_param, :contribution_type => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested contribution_type" do
      contribution_type = ContributionType.create! valid_attributes
      expect {
        delete :destroy, {:id => contribution_type.to_param}, valid_session
      }.to change(ContributionType, :count).by(-1)
    end

    it "redirects to the contribution_types list" do
      contribution_type = ContributionType.create! valid_attributes
      delete :destroy, {:id => contribution_type.to_param}, valid_session
      expect(response).to redirect_to(contribution_types_url)
    end
  end

end
