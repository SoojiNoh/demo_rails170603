class Api::SessionsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session
  prepend_before_filter :require_no_authentication, :only => [:create ]
#   include Devise::Controllers::InternalHelpers

#   include Devise::Controllers::Helpers

  def create
    build_resource
    resource = User.find_for_database_authentication(:login=>params[:user_login][:login])
    if resource.nil?
      render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
    end

    if resource.valid_password?(params[:user_login][:password])
      sign_in("user", resource)
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :login=>resource.login, :email=>resource.email}
    else
      return
    end
    invalid_login_attempt
  end
  
  def destroy
    sign_out(resource_name)
  end

  protected
  def ensure_params_exist
    return unless params[:user_login].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end    
end
