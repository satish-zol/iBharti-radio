class CreateSongUploads < ActiveRecord::Migration
  def change
    create_table :song_uploads do |t|
      t.string :file
      t.references :song

      t.timestamps
    end
    add_index :song_uploads, :song_id
  end
end
