class Song < ActiveRecord::Base
  belongs_to :category
  belongs_to :language
  belongs_to :tag
  has_one 	 :song_upload, :dependent => :destroy

  attr_accessible :name, :category_id, :language_id, :tag_id
end
