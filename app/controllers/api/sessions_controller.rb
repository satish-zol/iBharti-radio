class Api::SessionsController < Api::BaseController
  
  prepend_before_filter :require_no_authentication, :only => [:create ]
  include Devise::Controllers#::InternalHelpers
  
  before_filter :ensure_params_exist
 
  respond_to :json

  def new
    
    resource = User.find_for_database_authentication(:email=>params[:user_login][:email])
    return invalid_login_attempt unless resource
 
    if resource.valid_password?(params[:user_login][:password])
      sign_in("user", resource)
      resource.reset_authentication_token!
      render :json=> { :response_api => [{:success=>true, :auth_token=>resource.authentication_token, :email=>resource.email } ] }
      return
    end
    invalid_login_attempt
  
  end
  
  # def create
  #   build_resource
  #   resource = User.find_for_database_authentication(:email=>params[:user_login][:email])
  #   return invalid_login_attempt unless resource
 
  #   if resource.valid_password?(params[:user_login][:password])
  #     sign_in("user", resource)
  #     resource.reset_authentication_token!
  #     render :json=> {:success=>true, :auth_token=>resource.authentication_token, :email=>resource.email}
  #     return
  #   end
  #   invalid_login_attempt
  # end
  
  def destroy
    sign_out(resource_name)
    render :json=> {:success=>true}
  end
 
  protected
  def ensure_params_exist
    return unless params[:user_login].blank?
    render :json=>{:response_api => [ {:success=>false, :message=>"missing user_login parameter"}, :status=>422]}
  end
 
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:response_api => [{:success=>false, :message=>"Error with your login or password"}, :status=>401]}
  end
end