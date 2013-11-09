ActiveAdmin.register College do
  menu false

  index do 
    column :id,  :sortable => true
    column :name,  :sortable => true
    column :image, :sortable => true
    column :url, :sortable => true
    column :mount_point, :sortable => true
    column "" do ||
      button("Go live")
    end
    default_actions

  end
   
  
    
  form(:html => { :multipart => true }) do |f|
  
    f.inputs "College" do
      f.input :city
      f.input :name
      f.input :url
      f.input :image
          
    end
    f.buttons
  end


  controller do
    def create
      
      mount_point = College.new(params[:college])
      mount_point.mount_point = mount_point.name.split.join.downcase 
      mount_point.save
      redirect_to admin_college_path(mount_point)
    end

    def update
      mount_point = College.find(params[:id])
      mount_point.mount_point = mount_point.name.split.join.downcase 
      mount_point.update_attributes(params[:college])
      redirect_to admin_college_path(mount_point)
    end

    # def shout_playlist(mount_point)
      
    #   s = Shout.new
    #   s.mount = "/example" # "/#{object.name.split.join.downcase}.m3u"
    #   s.charset = "UTF-8"
    #   s.host = "localhost"
    #   s.user = "source"
    #   s.pass = "bpsi@123"
    #   s.format = Shout::MP3
    #   s.description ='fdggdfgd'
    #   s.connect
    # end 


  end

  
end
