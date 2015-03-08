require 'rails_helper'

describe "Association" do
  let(:member) { FactoryGirl.create(:member) }
  
  before(:each) do
    post login_path, email: member.email, password: member.password
  end

  describe "GET /association" do
    it "works! (now write some real specs)" do
      get association_path
      expect(response.status).to be(200)
    end
  end
end
