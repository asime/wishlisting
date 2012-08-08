class AddShortNameToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :short_name, :string
  end
end
