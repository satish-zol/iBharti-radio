class MainController < ApplicationController
  
  respond_to :html, :json, :xml, :js

  def index
  	song_dependent_data
    @songs = Song.all
  	respond_with(@songs)
  	# respond_to do |format|
   #    format.html # index.html.erb
   #    format.json { render json: @songs }
   #  end
  end

  def songs_by_lang   
    @songs = Song.where('language_id=?', params[:id]) 
    respond_with(@songs)
  end

  def songs_by_cat  
    @songs = Song.where('category_id=?', params[:id]) 
    respond_with(@songs)
  end




end

