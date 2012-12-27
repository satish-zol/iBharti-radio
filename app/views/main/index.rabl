collection :@songs
	attributes :id, :name
	node(:college_name) {|clg| clg.college.name  if clg.college.present? }
	node(:category_name) {|c| c.category.name }
	node(:language_name) {|l| l.language.name }
	node(:tag_name) {|t| t.tag.name }
	node(:city_name) {|c| c.city.name if c.city.present? }
	node(:file_url) {|u| u.song_upload.file.url if u.song_upload.present? } 
	  

