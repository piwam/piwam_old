require 'rails_helper'

describe SessionsController do
  
  let(:member) { FactoryGirl.create(:member) }

  describe "GET new" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "authenticates the member" do
        post :create, email: member.email, password: member.password
        expect(controller.current_member).to eq(member)
      end

      it "redirects to the members index page" do
        post :create, email: member.email, password: member.password
        expect(response).to redirect_to(root_url)
      end
    end

    describe "with invalid params" do
      it "do not authenticate the member" do
        post :create, email: member.email, password: "invalid password"
        expect(controller.current_member).to be_nil
      end

      it "re-renders the 'new' template" do
        post :create, email: member.email, password: "invalid password"
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET destroy" do
    it "logout the current member" do
      post :create, email: member.email, password: member.password
      expect(controller.current_member).to eq(member)
      get :destroy
      expect(controller.current_member).to be_nil
    end

    it "redirects to the login page" do
      get :destroy
      expect(response).to redirect_to(login_path)
    end
  end

end