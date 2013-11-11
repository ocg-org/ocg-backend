require "spec_helper"

describe RocksController do
  describe "routing" do

    it "routes to #index" do
      get("/rocks").should route_to("rocks#index")
    end

    it "routes to #new" do
      get("/rocks/new").should route_to("rocks#new")
    end

    it "routes to #show" do
      get("/rocks/1").should route_to("rocks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rocks/1/edit").should route_to("rocks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rocks").should route_to("rocks#create")
    end

    it "routes to #update" do
      put("/rocks/1").should route_to("rocks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rocks/1").should route_to("rocks#destroy", :id => "1")
    end

  end
end
