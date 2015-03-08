require "rails_helper"

describe AssociationController do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/association").to route_to("association#index")
    end

    it "routes to #update" do
      expect(post: "/association").to route_to("association#update")
    end

  end
end