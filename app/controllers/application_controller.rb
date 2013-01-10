class ApplicationController < ActionController::Base
  protect_from_forgery

  # helper_method :language_helper
  helper_method :resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end



  private 
  
  def song_dependent_data
  	@categories ||= Category.order 'name'
    @languages ||= Language.order 'name'
    @tags ||= Tag.order 'name'
    @cities ||= City.order 'name'
    @colleges ||= College.order 'name'

    return @categories, @languages, @tags, @cities, @colleges
  end




end
