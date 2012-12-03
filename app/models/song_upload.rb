class SongUpload < ActiveRecord::Base
  belongs_to :song
  attr_accessible :file, :song_id

  mount_uploader :file, SongUploader
end
