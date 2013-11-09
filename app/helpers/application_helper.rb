require 'shout'
module ApplicationHelper

	# def sanitize_filename(file_name)  
	# 	filename = File.basename(file_name)  
	# 	filename.sub(/[^\w\.\-]/,'_')  
	# end 

	# def language_helper
	# 	@langs ||= Language.order 'name'
	# end
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
    
end
