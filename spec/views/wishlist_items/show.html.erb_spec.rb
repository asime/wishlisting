require 'spec_helper'

describe "wishlist_items/show" do
  before(:each) do
    @wishlist_item = assign(:wishlist_item, stub_model(WishlistItem,
      :item => "Item",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Item/)
    rendered.should match(/MyText/)
  end
end
