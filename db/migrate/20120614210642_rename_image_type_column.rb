class RenameImageTypeColumn < ActiveRecord::Migration
  def up
    rename_column :images, :type, :image_type
  end

  def down
    rename_column :images, :image_type, :type
  end
end
