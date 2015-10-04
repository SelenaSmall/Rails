class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  include Pundit
  protect_from_forgery with: :exception

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
end
