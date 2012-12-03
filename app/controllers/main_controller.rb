class MainController < ApplicationController
  
  respond_to :json, :xml
  def index
  	@songs = Song.order 'name'
  	# respond_to do |format|
   #    format.html # index.html.erb
   #    format.json { render json: @songs }
   #  end
  end


end
