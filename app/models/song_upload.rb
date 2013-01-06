class SongUpload < ActiveRecord::Base
  resourcify
  belongs_to :song
  attr_accessible :file, :song_id

  mount_uploader :file, SongUploader
end
