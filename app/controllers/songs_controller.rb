class SongsController < ApplicationController


  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.order 'id'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  respond_to :json, :xml
  def new
    @song = Song.new
    @categories = Category.order 'name'
    @languages = Language.order 'name'
    @tags = Tag.order 'name'
    @cities = City.order 'name'
    @song_upload = SongUpload.new
    #response = {:song => @song, :categories => @categories, :languages => @languages, :tags => @tags}
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: response }
    # end
    #respond_with(response)
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
    @categories = Category.order 'name'
    @languages = Language.order 'name'
    @tags = Tag.order 'name'
    @cities = City.order 'name'
  end

  # POST /songs
  # POST /songs.json
  def create
    
      @song = Song.create(params[:song])
      
      thread = Thread.new { @song_upload = SongUpload.create(:song_id => @song.id, :file => params[:file])   }
    respond_to do |format|
      if @song && thread
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
 
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    
    @song = Song.find(params[:id])
    thread = Thread.new{@song.update_attributes(params[:song]) && @song.song_upload.update_attributes(:file => params[:file])}     
    respond_to do |format|
      if thread
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end
 
end
