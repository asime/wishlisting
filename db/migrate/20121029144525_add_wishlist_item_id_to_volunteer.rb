class AddWishlistItemIdToVolunteer < ActiveRecord::Migration
  change_table :volunteers do |t|
	  t.references :wishlist_item
  end
end
