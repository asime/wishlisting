class Volunteer < ActiveRecord::Base
  belongs_to :wishlist_items
  attr_accessible :comment, :email, :name, :phone, :wishlist_item_id
end
