
class CollegesController < ApplicationController
  #before_filter :authenticate_user!#, :except => [:connect_to_server]
  #load_and_authorize_resource
  # GET /colleges
  # GET /colleges.json

  after_filter :mount_point_for_clg, :only =>  :shout_playlist

    
    #@mount = []
    

  def index
    #debugger
    @colleges = College.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colleges }
    end
  end

  # GET /colleges/1
  # GET /colleges/1.json
  def show
    @college = College.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @college }
    end
  end

  # GET /colleges/new
  # GET /colleges/new.json
  def new
    @cities = City.order 'name'
    @college = College.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @college }
    end
  end

  # GET /colleges/1/edit
  def edit
    @cities = City.order 'name'
    @college = College.find(params[:id])
  end

  # POST /colleges
  # POST /colleges.json
  def create
    @college = College.new(params[:college])

    respond_to do |format|
      if @college.save
        format.html { redirect_to @college, notice: 'College was successfully created.' }
        format.json { render json: @college, status: :created, location: @college }
      else
        format.html { render action: "new" }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /colleges/1
  # PUT /colleges/1.json
  def update
    @college = College.find(params[:id])

    respond_to do |format|
      if @college.update_attributes(params[:college])
        format.html { redirect_to '/colleges', notice: 'College was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colleges/1
  # DELETE /colleges/1.json
  def destroy
    @college = College.find(params[:id])
    @college.destroy

    respond_to do |format|
      format.html { redirect_to colleges_url }
      format.json { head :no_content }
    end
  end
  
  BLOCKSIZE = 16384
  # connect to icecast server
  def shout_playlist
    @clg_name = College.find(params[:id])
    #mount_name = @clg_name.mount_point
    #mount =  "/#{mount_name}.m3u" # doc[0].split.third unless doc[0].split.third.present? #"/#{mount_name}.m3u" # "/#{object.name.split.join.downcase}.m3u"
    # s.charset = "UTF-8"
    # s.port = 8022
    # s.host = "localhost"
    # s.user = "source"
    # s.pass = "bpsi@123"
    # s.format = Shout::MP3
    #@s.description ='song classic'
     
     # @s.connect
    #puts "open VLC and open network -> http://#{@s.host}:#{@s.port}"+"#{@s.mount}"
    
    # puts s.description
    # filename = "#{Rails.root}/public/Playlist/qwerty.m3u"
    # #ARGV.each do |filename|
    #   debugger
    #   File.open(filename) do |file|
    #     puts "sending data from #{file}"
    #     m = ShoutMetadata.new
    #     m.add 'filename', filename
    #     m.add 'title', 'title'
    #     @s.metadata = m

    #     while data = file.read(BLOCKSIZE)
    #        @s.send data
    #        @s.sync
    #      end

    #   end
    #end

    # s.disconnect   
     #redirect_to :back
     #s.connect
     render :text => "Connect"
  end

   def get_icecast_status(connection)
    mount_point = Nokogiri::HTML(open("http://#{request.host}:8022/status.xsl"))
  end

  
end
