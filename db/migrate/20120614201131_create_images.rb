class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.binary :image
      t.string :description
      t.boolean :type

      t.timestamps
    end
  end
end
