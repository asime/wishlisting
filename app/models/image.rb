class Image < ActiveRecord::Base
  belongs_to :wishlist_items
  attr_accessible :description, :image, :image_type, :wishlist_item_id
  
  validates_inclusion_of :image_type, :in => [true,false]
end
