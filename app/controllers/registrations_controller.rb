class RegistrationsController < Devise::RegistrationsController
	before_filter :authenticate_user!, :only => :token
	skip_before_filter :verify_authenticity_token, :only => :create, :if => Proc.new { |c| c.request.format == 'application/json' }
	
	def new
	  super
	end

	def create
		resource = User.new(params[:resource])
    if resource.save
      flash[:notice] = "You have signed up successfully. A confirmation was sent to your e-mail."
      respond_to do |format|
				format.json {
		  		if !params[:api_key].blank? and params[:api_key] == API_KEY
		    		build_resource
		    		if resource.save
		      		sign_in(resource)
		      		resource.reset_authentication_token!
		      		render :template => '/devise/registrations/signed_up' #rabl template with authentication token
		    		else
		      		render :template => '/devise/registrations/new' #rabl template with errors
		    		end
		  		else
		    		render :json => {'errors'=>{'api_key' => 'Invalid'}}.to_json, :status => 401
		  		end
				}
				format.any{super}
			end
    else
      render :action => :new
    end
	end

	def update
    super
  end
end
