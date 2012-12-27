class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.references :city

      t.timestamps
    end
    add_index :colleges, :city_id
  end
end
