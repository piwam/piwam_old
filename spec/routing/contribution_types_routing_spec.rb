require "rails_helper"

describe ContributionTypesController do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/contribution_types").to route_to("contribution_types#index")
    end

    it "routes to #new" do
      expect(get: "/contribution_types/new").to route_to("contribution_types#new")
    end

    it "routes to #edit" do
      expect(get: "/contribution_types/1/edit").to route_to("contribution_types#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/contribution_types").to route_to("contribution_types#create")
    end

    it "routes to #update" do
      expect(put: "/contribution_types/1").to route_to("contribution_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/contribution_types/1").to route_to("contribution_types#destroy", id: "1")
    end

  end
end
