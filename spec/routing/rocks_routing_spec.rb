require "spec_helper"

describe RocksController do
  describe "routing" do

    it "routes to #index" do
      get("/rocks").should route_to("rocks#index")
    end

    it "routes to #new" do
      r = FactoryGirl.create(:region)
      get("/regions/#{r.id}/rocks/new").should route_to("rocks#new", :region_id => r.id.to_s)
    end

    it "routes to #show" do
      get("/rocks/1").should route_to("rocks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rocks/1/edit").should route_to("rocks#edit", :id => "1")
    end

    it "routes to #create" do
      r = FactoryGirl.create(:region)
      post("/regions/#{r.id}/rocks").should route_to("rocks#create", :region_id => r.id.to_s)
    end

    it "routes to #update" do
      put("/rocks/1").should route_to("rocks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rocks/1").should route_to("rocks#destroy", :id => "1")
    end

  end
end
