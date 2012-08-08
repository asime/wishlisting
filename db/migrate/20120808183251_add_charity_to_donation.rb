class AddCharityToDonation < ActiveRecord::Migration
  change_table :donations do |t|
	  t.references :charity
  end
end
