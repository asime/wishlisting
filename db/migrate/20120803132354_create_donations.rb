class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :fname
      t.string :lname
      t.decimal :amount
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :postal
      t.string :email
      t.string :phone
      t.boolean :processed

      t.timestamps
    end
  end
end
