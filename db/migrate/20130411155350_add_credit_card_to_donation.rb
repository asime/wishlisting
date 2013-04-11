class AddCreditCardToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :credit_card, :string
    add_column :donations, :exp_month, :string
    add_column :donations, :exp_year, :string
    add_column :donations, :processor_message, :string
  end
end
