class Api::RegistrationsController < Api::BaseController
  before_filter :authenticate_user!, :only => :token
  
  respond_to :json
  def new
 
    user = User.new(params[:user])
    if user.save
      #debugger
      render :json=> {:response_api => [:auth_token=>user.authentication_token, :email=>user.email, :status=>201]} 
      return
    else
      warden.custom_failure!
      render :json=> {:response_api => [user.errors, :status=>422]}
    end
  end


  # def new
  #   super
  # end

  # def new
  #   resource = User.new(params[:resource])
  #   if resource.save
  #     flash[:notice] = "You have signed up successfully. A confirmation was sent to your e-mail."
  #     respond_to do |format|
  #       format.json {
  #         if !params[:api_key].blank? and params[:api_key] == API_KEY
  #           build_resource
  #           if resource.save
  #             sign_in(resource)
  #             resource.reset_authentication_token!
  #             render :template => '/devise/registrations/signed_up' #rabl template with authentication token
  #           else
  #             render :template => '/devise/registrations/new' #rabl template with errors
  #           end
  #         else
  #           render :json => {'errors'=>{'api_key' => 'Invalid'}}.to_json, :status => 401
  #         end
  #       }
  #       format.any{super}
  #     end
  #   else
  #     render :action => :new
  #   end
  # end

  # def update
  #   super
  # end
end