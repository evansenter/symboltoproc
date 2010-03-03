# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "main"
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  helper_method :authorized?, :current_user
  
  def authorized?
    if !instance_variable_defined?(:@client) && session[:twitter_access_token] && session[:twitter_access_secret]
      @client = Twitterite.new(:token => session[:twitter_access_token], :secret => session[:twitter_access_secret])
    end
    
    @client if @client.try(:authorized?)
  end
  
  def current_user
    @client || authorized?
  end
  
  def authorize
    unless authorized?
      flash[:notice] = "You do not have permission for that page."
      redirect_to root_path
    end
  end
end
