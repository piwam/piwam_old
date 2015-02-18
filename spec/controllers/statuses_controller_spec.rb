require 'rails_helper'

describe StatusesController do

  let(:member) { FactoryGirl.create(:member) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:status) }
  let(:invalid_attributes) { { label: nil } }
  let(:valid_session) { { member_id: member.id } }

  describe "GET #index" do
    it "assigns all statuses as @statuses" do
      status = Status.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:statuses)).to eq([status])
    end
  end

  describe "GET #new" do
    it "assigns a new status as @status" do
      get :new, {}, valid_session
      expect(assigns(:status)).to be_a_new(Status)
    end
  end

  describe "GET #edit" do
    it "assigns the requested status as @status" do
      status = Status.create! valid_attributes
      get :edit, {:id => status.to_param}, valid_session
      expect(assigns(:status)).to eq(status)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Status" do
        expect {
          post :create, {:status => valid_attributes}, valid_session
        }.to change(Status, :count).by(1)
      end

      it "assigns a newly created status as @status" do
        post :create, {:status => valid_attributes}, valid_session
        expect(assigns(:status)).to be_a(Status)
        expect(assigns(:status)).to be_persisted
      end

      it "redirects to the statuses list" do
        post :create, {:status => valid_attributes}, valid_session
        expect(response).to redirect_to(statuses_url)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved status as @status" do
        post :create, {:status => invalid_attributes}, valid_session
        expect(assigns(:status)).to be_a_new(Status)
      end

      it "re-renders the 'new' template" do
        post :create, {:status => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { label: 'Invité' } }

      it "updates the requested status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => new_attributes}, valid_session
        status.reload
        expect(status.label).to eq('Invité')
      end

      it "assigns the requested status as @status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => valid_attributes}, valid_session
        expect(assigns(:status)).to eq(status)
      end

      it "redirects to the statuses list" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => valid_attributes}, valid_session
        expect(response).to redirect_to(statuses_url)
      end
    end

    context "with invalid params" do
      it "assigns the status as @status" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => invalid_attributes}, valid_session
        expect(assigns(:status)).to eq(status)
      end

      it "re-renders the 'edit' template" do
        status = Status.create! valid_attributes
        put :update, {:id => status.to_param, :status => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested status" do
      status = Status.create! valid_attributes
      expect {
        delete :destroy, {:id => status.to_param}, valid_session
      }.to change(Status, :count).by(-1)
    end

    it "redirects to the statuses list" do
      status = Status.create! valid_attributes
      delete :destroy, {:id => status.to_param}, valid_session
      expect(response).to redirect_to(statuses_url)
    end
  end

end
