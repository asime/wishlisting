class Donation < ActiveRecord::Base
  belongs_to :charities
  attr_accessible :charity_id, :amount, :city, :email, :fname, :lname, :phone, :postal, :processed, :state, :street1, :street2
  validates :charity_id, :amount, :city, :email, :fname, :lname, :postal, :state, :street1, presence: true
end
