require "spec_helper"

describe CharitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/charities").should route_to("charities#index")
    end

    it "routes to #new" do
      get("/charities/new").should route_to("charities#new")
    end

    it "routes to #show" do
      get("/charities/1").should route_to("charities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/charities/1/edit").should route_to("charities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/charities").should route_to("charities#create")
    end

    it "routes to #update" do
      put("/charities/1").should route_to("charities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/charities/1").should route_to("charities#destroy", :id => "1")
    end

  end
end
