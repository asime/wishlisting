class AddGoalToWishlistItem < ActiveRecord::Migration
  def change
    add_column :wishlist_items, :goal, :decimal
  end
end
