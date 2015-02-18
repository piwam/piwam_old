require 'rails_helper'

describe "Contributions" do
  let(:member) { FactoryGirl.create(:member) }
  
  before(:each) do
    post login_path, email: member.email, password: member.password
  end

  describe "GET /contributions" do
    it "works! (now write some real specs)" do
      get contributions_path
      expect(response.status).to be(200)
    end
  end
end
