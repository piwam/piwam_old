require "rails_helper"

describe MailingsController do
  describe "routing" do

    it "routes to #new" do
      expect(get: "/mailings/new").to route_to("mailings#new")
    end

    it "routes to #create" do
      expect(post: "/mailings").to route_to("mailings#create")
    end

  end
end
