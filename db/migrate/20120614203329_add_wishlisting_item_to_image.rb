class AddWishlistingItemToImage < ActiveRecord::Migration
  change_table :images do |t|
    t.references :wishlist_item
  end
end
