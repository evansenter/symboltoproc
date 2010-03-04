class SessionsController < ApplicationController
  def login
    twitter_request = Twitterite.request_token(twitter_authenticate_url)
    
    session[:original_location]      = params[:original_location]
    session[:twitter_request_token]  = twitter_request.token
    session[:twitter_request_secret] = twitter_request.secret
    
    redirect_to twitter_request.authorize_url
  end
  
  def authenticate
    client         = Twitterite.new
    twitter_access = client.authorize(session.delete(:twitter_request_token), session.delete(:twitter_request_secret), :oauth_verifier => params[:oauth_verifier])
    
    if client.authorized?
      session[:twitter_access_token]  = twitter_access.token
      session[:twitter_access_secret] = twitter_access.secret
      
      flash[:notice] = "Login successful!"
    end
  rescue OAuth::Unauthorized => error
    flash[:notice] = "Sorry, but you don't appear to be authorized!"
  ensure
    redirect_to session.delete(:original_location) || root_path
  end
end