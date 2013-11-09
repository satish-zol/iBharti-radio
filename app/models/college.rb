require "shout"
class College < ActiveRecord::Base
  #after_create :mount_college 
  #after_update :update_mount_point
  resourcify
  belongs_to :city
  has_many   :songs
  attr_accessible :name, :url, :city_id, :image, :mount_point
  mount_uploader :image


  	#BLOCKSIZE = 16384

	# def mount_college
	# 	clg_name = College.find(self)
	# 	clg_name.mount_point = clg_name.name.split.join.downcase 
 #      	clg_name.update_attributes(:mount_point => clg_name.name.split.join.downcase )
 #    	mount_name = clg_name.mount_point
 #    	debugger
	# 	s = Shout.new
	# 	s.mount = "/#{mount_name}.m3u" #unless doc[0].split.third.present? #"/#{mount_name}.m3u" # "/#{object.name.split.join.downcase}.m3u"
	# 	s.charset = "UTF-8"
	# 	s.port = 8022
	# 	s.host = "localhost"
	# 	s.user = "source"
	# 	s.pass = "bpsi@123"
	# 	s.format = Shout::MP3
	# 	s.description ='song classic'
	# 	s.connect
	# end
  
  def self.college_radio
  	where(:id => self.id)
  end
end
