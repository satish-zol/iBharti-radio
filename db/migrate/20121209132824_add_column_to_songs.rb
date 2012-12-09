class AddColumnToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :city_id, :integer
  end
end
