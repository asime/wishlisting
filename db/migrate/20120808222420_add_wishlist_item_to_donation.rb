class AddWishlistItemToDonation < ActiveRecord::Migration
  change_table :donations do |t|
	  t.references :wishlist_item
  end
end
