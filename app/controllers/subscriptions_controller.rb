class SubscriptionsController < ApplicationController
  def create
  	@category = Category.find_or_create_by(name: subscription_params[:category].downcase)
  	@subscription = Subscription.new
  	@subscription.account = current_user
  	@subscription.category = @category
  	if @subscription.valid?
  		@subscription.save
  	end
  	render json: @subscription, status: 201
  end

  def show
    @subscription = Subscription.find(params[:id])
    render json: @subscription
  end

  def index
  end

  def destroy
    category=params[:id]
    account=params[:account_id]
    subscription=Subscription.find_by(category_id: category, account_id: account)
    subscription.destroy
    render json: Account.find(account)
  end

  private
  def subscription_params
  	params.require(:subscription).permit(:category)
  end
end
