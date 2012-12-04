collection :@songs
	attributes :id, :name
	node(:category_name) {|c| c.category.name }
	node(:language_name) {|l| l.language.name }
	node(:tag_name) {|t| t.tag.name }
	node(:file_url) {|u| u.song_upload.file.url } 
	  

