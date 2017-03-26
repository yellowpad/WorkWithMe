class AccountsController < ApplicationController
	def index 
		render plain: "HIIIII"
	end

	def show 
		@account = Account.find(params[:id])
	end
end
