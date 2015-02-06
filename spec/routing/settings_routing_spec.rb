require "rails_helper"

describe SessionsController do
  describe "routing" do

    it "routes to #association" do
      expect(get: "/association").to route_to("settings#association")
    end

    it "routes to #index" do
      expect(get: "/settings").to route_to("settings#index")
    end

    it "routes to #update" do
      expect(post: "/settings").to route_to("settings#update")
    end

  end
end