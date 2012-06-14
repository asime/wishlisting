class AddCharityToWishlistItem < ActiveRecord::Migration
  change_table :wishlist_items do |t|
    t.references :charity
  end
end
