class SessionsController < ApplicationController
  before_filter :authorize, :except => [:new, :create, :destroy]
  
  def create
    session[:password] = params[:password]
    flash[:notice] = "Login successful."
    redirect_to root_path
  end
  
  def destroy
    reset_session
    flash[:notice] = "Logout successful."
    redirect_to root_path
  end
end