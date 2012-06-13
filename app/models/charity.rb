class Charity < ActiveRecord::Base
  attr_accessible :about, :charity_name, :contact_name, :email, :login, :password
end
