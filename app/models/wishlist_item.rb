class WishlistItem < ActiveRecord::Base
  belongs_to :charities
  has_many :images
  attr_accessible :description, :item, :charity_id
end
