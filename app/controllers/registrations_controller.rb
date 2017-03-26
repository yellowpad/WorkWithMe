class RegistrationsController < ApplicationController
	skip_before_action :require_login
	
	def new 
		@account = Account.new
	end

	def create 
		@account = Account.new(account_params)
		if @account.valid?	
			@account.save
			session["account_id"] = @account.id
			redirect_to @account
		else 
			flash[:error] = @account.errors.full_messages[0]
			render :new
		end
	end

	private
	  def account_params
	    params.require(:account).permit(:username,:password,:password_confirmation,:email)
	  end
end
