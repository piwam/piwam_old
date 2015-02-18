require 'rails_helper'

describe "ContributionTypes" do
  let(:member) { FactoryGirl.create(:member) }
  
  before(:each) do
    post login_path, email: member.email, password: member.password
  end
  
  describe "GET /contribution_types" do
    it "works! (now write some real specs)" do
      get contribution_types_path
      expect(response.status).to be(200)
    end
  end
end
