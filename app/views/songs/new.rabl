collection :@song 
	attributes :id, :name



child :@categories do
	attributes :id, :name

end

child :@languages do
	attributes :id, :name
end

child :@tags do
	attributes :id, :name
end

child :@song_upload do
	attributes :file
end 



