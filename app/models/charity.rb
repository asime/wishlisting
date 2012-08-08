class Charity < ActiveRecord::Base
  attr_accessible :about, :charity_name, :contact_name, :email, :login, :password, :dts_url, :short_name
end
