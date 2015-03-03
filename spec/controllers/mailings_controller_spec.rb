require 'rails_helper'

describe MailingsController do

  let(:current_member) { FactoryGirl.create(:member) }
  let(:valid_attributes) { { from: 'sender@example.com', to: ['recipient@example.com'], subject: 'Test email', body: 'Test email content' } }
  let(:invalid_attributes) { { from: nil } }
  let(:valid_session) { { member_id: current_member.id } }

  describe "GET #new" do
    it "assigns a new mailing as @mailing" do
      get :new, {}, valid_session
      expect(assigns(:mailing)).to be_a_new(Mailing)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Mailing" do
        expect {
          post :create, {:mailing => valid_attributes}, valid_session
        }.to change(Mailing, :count).by(1)
      end

      it "sends the email" do
        expect {
          post :create, {:mailing => valid_attributes}, valid_session
        }.to change(ActionMailer::Base.deliveries, :count).by(1)
      end

      it "assigns a newly created mailing as @mailing" do
        post :create, {:mailing => valid_attributes}, valid_session
        expect(assigns(:mailing)).to be_a(Mailing)
        expect(assigns(:mailing)).to be_persisted
      end

      it "redirects to the created mailing" do
        post :create, {:mailing => valid_attributes}, valid_session
        expect(response).to redirect_to(new_mailing_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved mailing as @mailing" do
        post :create, {:mailing => invalid_attributes}, valid_session
        expect(assigns(:mailing)).to be_a_new(Mailing)
      end

      it "re-renders the 'new' template" do
        post :create, {:mailing => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

end
