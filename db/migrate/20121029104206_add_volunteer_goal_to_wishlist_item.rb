class AddVolunteerGoalToWishlistItem < ActiveRecord::Migration
  def change
    add_column :wishlist_items, :volunteer_goal, :integer
  end
end
