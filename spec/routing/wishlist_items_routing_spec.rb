require "spec_helper"

describe WishlistItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/wishlist_items").should route_to("wishlist_items#index")
    end

    it "routes to #new" do
      get("/wishlist_items/new").should route_to("wishlist_items#new")
    end

    it "routes to #show" do
      get("/wishlist_items/1").should route_to("wishlist_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wishlist_items/1/edit").should route_to("wishlist_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wishlist_items").should route_to("wishlist_items#create")
    end

    it "routes to #update" do
      put("/wishlist_items/1").should route_to("wishlist_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wishlist_items/1").should route_to("wishlist_items#destroy", :id => "1")
    end

  end
end
