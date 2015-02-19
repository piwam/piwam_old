require 'rails_helper'

describe "Activities" do
  let(:member) { FactoryGirl.create(:member) }
  
  before(:each) do
    post login_path, email: member.email, password: member.password
  end

  describe "GET /activities" do
    it "works! (now write some real specs)" do
      get activities_path
      expect(response.status).to be(200)
    end
  end
end
