class AddColumnCollegeIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :college_id, :integer
  end
end
