class ApplicationController < ActionController::Base
  protect_from_forgery

  # helper_method :language_helper



  private 

  def song_dependent_data
  	@categories ||= Category.order 'name'
    @languages ||= Language.order 'name'
    @tags ||= Tag.order 'name'
    @cities ||= City.order 'name'
    #@colleges ||= College.order 'name'

    return @categories, @languages, @tags, @cities, @colleges
  end

end
