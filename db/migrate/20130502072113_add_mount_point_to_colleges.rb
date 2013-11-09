class AddMountPointToColleges < ActiveRecord::Migration
  def change
    add_column :colleges, :mount_point, :string
  end
end
