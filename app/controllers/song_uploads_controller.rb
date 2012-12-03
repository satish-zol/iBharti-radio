class SongUploadsController < ApplicationController
  # GET /song_uploads
  # GET /song_uploads.json
  def index
    @song_uploads = SongUpload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @song_uploads }
    end
  end

  # GET /song_uploads/1
  # GET /song_uploads/1.json
  def show
    @song_upload = SongUpload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song_upload }
    end
  end

  # GET /song_uploads/new
  # GET /song_uploads/new.json
  def new
    @song_upload = SongUpload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song_upload }
    end
  end

  # GET /song_uploads/1/edit
  def edit
    @song_upload = SongUpload.find(params[:id])
  end

  # POST /song_uploads
  # POST /song_uploads.json
  def create
    @song_upload = SongUpload.new(params[:song_upload])

    respond_to do |format|
      if @song_upload.save
        format.html { redirect_to @song_upload, notice: 'Song upload was successfully created.' }
        format.json { render json: @song_upload, status: :created, location: @song_upload }
      else
        format.html { render action: "new" }
        format.json { render json: @song_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /song_uploads/1
  # PUT /song_uploads/1.json
  def update
    @song_upload = SongUpload.find(params[:id])

    respond_to do |format|
      if @song_upload.update_attributes(params[:song_upload])
        format.html { redirect_to @song_upload, notice: 'Song upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_uploads/1
  # DELETE /song_uploads/1.json
  def destroy
    @song_upload = SongUpload.find(params[:id])
    @song_upload.destroy

    respond_to do |format|
      format.html { redirect_to song_uploads_url }
      format.json { head :no_content }
    end
  end
end
