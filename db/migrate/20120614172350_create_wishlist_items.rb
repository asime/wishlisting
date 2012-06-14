class CreateWishlistItems < ActiveRecord::Migration
  def change
    create_table :wishlist_items do |t|
      t.string :item
      t.text :description

      t.timestamps
    end
  end
end
