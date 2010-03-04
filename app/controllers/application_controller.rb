# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "main"
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  helper_method :authorized?, :current_user, :admin?
  
  def authorized?
    if !instance_variable_defined?(:@client) && session[:twitter_access_token] && session[:twitter_access_secret]
      @client = Twitterite.new(:token => session[:twitter_access_token], :secret => session[:twitter_access_secret])
    end
    
    @client if @client.try(:authorized?)
  end
  
  def current_user
    ((@client || authorized?).try(:info) || {}).symbolize_keys
  end
  
  def admin?
    current_user["screen_name"] == ENV["BLOG_OWNER"]
  end
end
