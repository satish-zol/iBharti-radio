class Song < ActiveRecord::Base
  resourcify
  belongs_to :college	
  belongs_to :category
  belongs_to :language
  belongs_to :tag
  belongs_to :city
  #has_one 	 :song_upload, :dependent => :destroy

  attr_accessible :name, :category_id, :file, :language_id, :tag_id, :city_id, :college_id
  
  mount_uploader :file, SongUploader
end
