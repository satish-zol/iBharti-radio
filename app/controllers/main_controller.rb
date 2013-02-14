class MainController < ApplicationController
  
  require 'net/http'
  require 'uri'

  before_filter :song_dependent_data 
  
  respond_to :html, :json, :xml, :js

  def index
    #@song = open('http://184.73.196.212:8000/live')
    #debugger
  	@songs = Song.order 'college_id'
  	respond_with(@songs)
  	# respond_to do |format|
   #    format.html # index.html.erb
   #    format.json { render json: @songs }
   #  end
  end

  def open(url)
    Net::HTTP.get(URI.parse(url))
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

