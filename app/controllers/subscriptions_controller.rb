class SubscriptionsController < ApplicationController
  def create
  	@category = Category.find_or_create_by(name: subscription_params[:category].downcase)
  	@subscription = Subscription.new
  	@subscription.account = current_user
  	@subscription.category = @category
  	if @subscription.valid?
  		@subscription.save
  	end
  	render json: @category, status: 201
  end

  private
  def subscription_params
  	params.require(:subscription).permit(:category)
  end
end
