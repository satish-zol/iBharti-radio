ActiveAdmin.register Song do
  menu false
  config.clear_action_items!
  filter :id
  filter :file
  config.sort_order = "id_asc"
  config.per_page = 10
  
   index :download_links => false do 
   	column :id,  :sortable => true
   	column :name, :sortable => true
    column :created_at,  :sortable => true
    column :updated_at,  :sortable => true
    column :file
    default_actions
   end


      
  form(:html => { :multipart => true }) do |f|
  
    f.inputs "Song" do
      f.input :college
      f.input :category
      f.input :language
      f.input :tag
      f.input :city
      f.input :file, :as => :file
          
    end
    f.buttons
  end
 
  controller do
    
    # Method for creating new Playlist. 
    def create_playlist 
      @selected_songs = Song.find(params[:new_playlist][:songs].reject(&:empty?))
      
      # selected_song.name and selected_song.file 
      file = File.new("#{Rails.root}/public/Playlist/#{params[:new_playlist][:name]}.txt", "w") 
      @selected_songs.each do |song| 
          file.write("#{song.file}\n")
      end
      file.close
      redirect_to "/admin/playlist"
      flash[:notice] = "New playlist created."
    end

    # Method for showing the playlist song.
    def show_songs_in_playlist
      
      file_name = params[:file_name]

      @song_list = []
      File.read("#{Rails.root}/public/Playlist/#{params[:file_name]}").each_line do |line|
        @song_list << line.chop
      end
    end

  end
end

# Create a page for playlist 
 ActiveAdmin.register_page "Playlist" do
  menu false 
 
  action_item do
    link_to "New Playlist", admin_new_playlist_path#, :method => :post
  end
  # For showing the playlist
    content do
      panel "Playlist" do
        render "/admin/songs/all_playlist"
      end
    end
end


  # Create a page for NEW playlist 
ActiveAdmin.register_page "New playlist" do
  menu false
  #@songs =Song.order "id"
  content do
    panel "Create a new Form" do
      render "/admin/songs/form"
    end
  end  
end
#  Create a page for NEW playlist 
ActiveAdmin.register_page "Show songs in playlist" do
  menu false
  
end