class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private
  def authorize_access
  	if not session[:user_id]
  		flash[:notice] = "Please log in"
  		redirect_to log_in_path
  		return false
  	end
  end
end
