require 'rails_helper'

describe MembersController do

  let(:valid_attributes) { { last_name: 'Doe', first_name: 'John' } }
  let(:invalid_attributes) { { last_name: 'Doe', first_name: nil } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all members as @members" do
      member = Member.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:members)).to eq([member])
    end
  end

  describe "GET show" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :show, {:id => member.to_param}, valid_session
      expect(assigns(:member)).to eq(member)
    end
  end

  describe "GET new" do
    it "assigns a new member as @member" do
      get :new, {}, valid_session
      expect(assigns(:member)).to be_a_new(Member)
    end
  end

  describe "GET edit" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :edit, {:id => member.to_param}, valid_session
      expect(assigns(:member)).to eq(member)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Member" do
        expect {
          post :create, {:member => valid_attributes}, valid_session
        }.to change(Member, :count).by(1)
      end

      it "assigns a newly created member as @member" do
        post :create, {:member => valid_attributes}, valid_session
        expect(assigns(:member)).to be_a(Member)
        expect(assigns(:member)).to be_persisted
      end

      it "redirects to the created member" do
        post :create, {:member => valid_attributes}, valid_session
        expect(response).to redirect_to(Member.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved member as @member" do
        post :create, {:member => invalid_attributes}, valid_session
        expect(assigns(:member)).to be_a_new(Member)
      end

      it "re-renders the 'new' template" do
        post :create, {:member => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { { first_name: 'Jane' } }

      it "updates the requested member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => new_attributes}, valid_session
        member.reload
        expect(member.first_name).to eq('Jane')
      end

      it "assigns the requested member as @member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => valid_attributes}, valid_session
        expect(assigns(:member)).to eq(member)
      end

      it "redirects to the members list" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => valid_attributes}, valid_session
        expect(response).to redirect_to(members_url)
      end
    end

    describe "with invalid params" do
      it "assigns the member as @member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => invalid_attributes}, valid_session
        expect(assigns(:member)).to eq(member)
      end

      it "re-renders the 'edit' template" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested member" do
      member = Member.create! valid_attributes
      expect {
        delete :destroy, {:id => member.to_param}, valid_session
      }.to change(Member, :count).by(-1)
    end

    it "redirects to the members list" do
      member = Member.create! valid_attributes
      delete :destroy, {:id => member.to_param}, valid_session
      expect(response).to redirect_to(members_url)
    end
  end

end
