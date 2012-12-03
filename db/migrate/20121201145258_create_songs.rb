class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.references :category
      t.references :language
      t.references :tag

      t.timestamps
    end
    add_index :songs, :category_id
    add_index :songs, :language_id
    add_index :songs, :tag_id
  end
end
