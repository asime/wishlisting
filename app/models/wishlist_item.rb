class WishlistItem < ActiveRecord::Base
  belongs_to :charities
  attr_accessible :description, :item, :charity_id
end
