class AddDtsUrlToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :dts_url, :string
  end
end
