class StaticController < ApplicationController
    skip_before_action :require_login

	def home
    if logged_in?
      redirect_to current_user
    else
      redirect_to login_path
    end
	end
end
