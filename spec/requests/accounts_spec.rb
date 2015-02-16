require 'rails_helper'

describe "Accounts", type: :request do
  let(:member) { FactoryGirl.create(:member) }
  
  before(:each) do
    post login_path, email: member.email, password: member.password
  end

  describe "GET /accounts" do
    it "works! (now write some real specs)" do
      get accounts_path
      expect(response.status).to be(200)
    end
  end
end
