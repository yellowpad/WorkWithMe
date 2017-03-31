class AccountsController < ApplicationController
	def index
		render plain: "HIIIII"
	end

	def show
		@account = Account.find(params[:id])
		@subscription=Subscription.new
		if current_user != @account
			render plain: "poop"
		end
		respond_to do |format|
			format.html
			format.json{
				render json: @account
			}
		end
	end

end
