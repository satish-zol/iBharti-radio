object @songs
	attributes :id, :name, :category, :language, :tag

	child :song_upload do
	  attributes :song_id, :file
	  end

