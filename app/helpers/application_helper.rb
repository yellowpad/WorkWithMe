module ApplicationHelper
	def current_user 
	  	if logged_in?
	  		current_user = Account.find(session[:account_id])
	  	end
  	end
	  def logged_in?
	  	!!session[:account_id]
	  end
end
