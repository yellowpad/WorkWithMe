class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :require_login

  def current_user 
  	if logged_in?
  		current_user = Account.find(session[:account_id])
  	end
  end
  
  def logged_in?
  	!!session[:account_id]
  end

  def require_login
  	if !logged_in?
  		redirect_to login_path
  	end
  end
end
