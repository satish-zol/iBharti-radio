class AddImageToColleges < ActiveRecord::Migration
  def change
    add_column :colleges, :image, :string
  end
end
