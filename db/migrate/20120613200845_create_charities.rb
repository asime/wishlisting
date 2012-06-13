class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :charity_name
      t.string :contact_name
      t.string :email
      t.string :login
      t.string :password
      t.text :about

      t.timestamps
    end
  end
end
