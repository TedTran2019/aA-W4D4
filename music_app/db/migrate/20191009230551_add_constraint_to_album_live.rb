class AddConstraintToAlbumLive < ActiveRecord::Migration[6.0]
  def change
    change_column :albums, :live, :boolean, null: false, default: false
  end
end
