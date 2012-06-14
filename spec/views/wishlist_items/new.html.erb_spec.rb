require 'spec_helper'

describe "wishlist_items/new" do
  before(:each) do
    assign(:wishlist_item, stub_model(WishlistItem,
      :item => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new wishlist_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wishlist_items_path, :method => "post" do
      assert_select "input#wishlist_item_item", :name => "wishlist_item[item]"
      assert_select "textarea#wishlist_item_description", :name => "wishlist_item[description]"
    end
  end
end
