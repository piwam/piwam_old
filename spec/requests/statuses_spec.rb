require 'rails_helper'

describe "Statuses" do
  let(:member) { FactoryGirl.create(:member) }
  
  before(:each) do
    post login_path, email: member.email, password: member.password
  end

  describe "GET /statuses" do
    it "works! (now write some real specs)" do
      get statuses_path
      expect(response.status).to be(200)
    end
  end
end
