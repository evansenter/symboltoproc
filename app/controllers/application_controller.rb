# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "main"
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  helper_method :admin?
  
  def admin?
    session[:password] == "password"
  end
  
  def authorize
    unless admin?
      flash[:notice] = "You do not have permission for that page."
      redirect_to root_path
    end
  end
end
