class MainController < ApplicationController
  #before_filter :authenticate_user!

  before_filter :song_dependent_data 
  
  respond_to :html, :json, :xml, :js

  def index

  	@songs = Song.order 'college_id'
    @college = College.find(:all)
  	respond_with(@songs)
  	# respond_to do |format|
   #    format.html # index.html.erb
   #    format.json { render json: @songs }
   #  end
  end

  def live_station
    @live_stations = College.order 'created_at ASC'

    respond_with(@live_stations)
  end



  def songs_by_lang   
    @songs = Song.where('language_id=?', params[:id]) 
    respond_with(@songs)
  end

  def songs_by_cat  
    @songs = Song.where('category_id=?', params[:id]) 
    respond_with(@songs)
  end

  def collegeradio_play_page  
    @college = College.find_by_id(params[:id])
  end



end

