object @song
   attributes :id, :name, :category_id, :language_id, :tag_id

   child @song_upload do 
     attributes :song_id, :file
   end