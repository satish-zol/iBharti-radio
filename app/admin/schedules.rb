ActiveAdmin.register Schedule do
  menu false

  index do 
   	column :program_name,  :sortable => true
   	column :start_time, :sortable => true
   	column :end_time, :sortable => true
   	column :scheduled_playlist_name, :sortable => true
    column :created_at,  :sortable => true
    column :updated_at,  :sortable => true
    default_actions
  end

  form(:html => { :multipart => true }) do |f|
  
    f.inputs "Program schedule" do
      f.input :program_name
      f.input :start_time, :as => :datetime, :ignore_date => false
      f.input :end_time, :as => :datetime, :ignore_date => false
      f.input :scheduled_playlist_name, :as => :check_boxes, :collection => Dir.entries("#{Rails.root}/public/Playlist/").select {|f| !File.directory? f}
    end
    f.buttons
  end

  
end
