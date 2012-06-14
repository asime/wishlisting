class AddImagesToWishlistItems < ActiveRecord::Migration
  change_table :wishlist_items do |t|
    t.references :image
  end
end
