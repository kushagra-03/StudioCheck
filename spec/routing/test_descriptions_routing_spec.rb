require "spec_helper"

describe TestDescriptionsController do
  describe "routing" do

    it "routes to #index" do
      get("/test_descriptions").should route_to("test_descriptions#index")
    end

    it "routes to #new" do
      get("/test_descriptions/new").should route_to("test_descriptions#new")
    end

    it "routes to #show" do
      get("/test_descriptions/1").should route_to("test_descriptions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/test_descriptions/1/edit").should route_to("test_descriptions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/test_descriptions").should route_to("test_descriptions#create")
    end

    it "routes to #update" do
      put("/test_descriptions/1").should route_to("test_descriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/test_descriptions/1").should route_to("test_descriptions#destroy", :id => "1")
    end

  end
end
