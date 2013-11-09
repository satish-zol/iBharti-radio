#require "shout"
#require 'nokogiri'
#require 'open-uri'

class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper
  #before_filter :ruby_stream
  # helper_method :language_helper
  helper_method :resource
  #helper_method :a
  # before_filter do 
  #   @s = Shout.new
  #   @s.charset = "UTF-8"
  #   @s.port = 8022
  #   @s.host = "localhost"
  #   @s.user = "source"
  #   @s.pass = "bpsi@123"
  #   @s.format = Shout::MP3
  #   #@s.description ='song classic'
  # end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  #def get_mountpoints(connection)
   # doc = get_icecast_status(connection)
    #doc.css('.streamheader h3').children.empty? ? false : doc.css('.streamheader h3').children.map{|c| c.text}
  #end


  private 
  
  def song_dependent_data
  	@categories ||= Category.order 'name'
    @languages ||= Language.order 'name'
    @tags ||= Tag.order 'name'
    @cities ||= City.order 'name'
    @colleges ||= College.order 'name'

    return @categories, @languages, @tags, @cities, @colleges
  end

  # def mount_point_for_clg
  #   #debugger  
  #   @s = Shout.new
  #   @s.charset = "UTF-8"
  #   @s.port = 8022
  #   @s.host = "localhost"
  #   @s.user = "source"
  #   @s.pass = "bpsi@123"
  #   @s.format = Shout::MP3
  #   #@s.description ='song classic'
  #   @s.mount = "#{@clg_name.mount_point}.m3u"
  #   @s.connect unless get_mountpoints(@s.mount).present?
  # end 

end
