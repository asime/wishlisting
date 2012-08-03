class Donation < ActiveRecord::Base
  attr_accessible :amount, :city, :email, :fname, :lname, :phone, :postal, :processed, :state, :street1, :street2
end
