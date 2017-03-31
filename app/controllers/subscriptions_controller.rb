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

  def destroy
    category=params[:id]
    account=params[:account_id]
    subscription=Subscription.find_by(category_id: category, account_id: account)
    subscription.destroy
  end

  private
  def subscription_params
  	params.require(:subscription).permit(:category)
  end
end
