require 'spec_helper'

describe "wishlist_items/index" do
  before(:each) do
    assign(:wishlist_items, [
      stub_model(WishlistItem,
        :item => "Item",
        :description => "MyText"
      ),
      stub_model(WishlistItem,
        :item => "Item",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of wishlist_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Item".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
