class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

 def after_sign_in_path_for(user)
    request.env['omniauth.origin'] || stored_location_for(user) || organisations_path
 end

#  before_action :authenticate_user!

#  protected
#  def pundit_user
#    if session[:organization_id]
#      UserContext.new(current_user, Organization.find(session[:organization_id]))
#    else
#      UserContext.new(current_user)
 #   end
 # end

 # def devise_parameter_sanitizer
 #   if resource_class == User
 #     User::ParameterSanitizer.new(User, :user, params)
 #   else
 #     super # Use the default one
 #   end
#  end
private
  def user_not_authorized
    redirect_to :back, :alert => "You don't have permission to those resources."
  end
end
