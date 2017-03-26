class SessionsController < ApplicationController
    skip_before_action :require_login
	
	def new 
		@account = Account.new
	end

	def create 
		@account= Account.find_by(username:login_params[:username])
		if @account && @account.authenticate(login_params[:password])
			session[:account_id] = @account.id
			redirect_to @account
		else
			@account = Account.new
			flash[:error] = "NO NO NO"
			render :new
		end
	end

	def destroy
		session.destroy
		redirect_to root_path
	end

	private 
		def login_params
			params.require(:account).permit(:username,:password)
		end
end
