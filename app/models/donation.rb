class Donation < ActiveRecord::Base
  belongs_to :charities
  belongs_to :wishlist_items
  attr_accessible :charity_id, :wishlist_item_id, :amount, :city, :email, :fname, :lname, :phone, :postal, :processed, :state, :street1, :street2, :credit_card, :exp_month, :exp_year, :processor_message, :cvv
  validates :charity_id, :amount, :city, :email, :fname, :lname, :postal, :state, :street1, presence: true

  def cvv
    #empty method since we don't store this, we just send it to processor
  end

end
