class AddIndexToTables < ActiveRecord::Migration[6.0]
  def change
    add_index :tracks, :album_id
    add_index :tracks, :title
  end
end
