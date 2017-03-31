class CategoriesController < ApplicationController


	def new
		@category = Category.new
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		respond_to do |format|
			format.html
			format.json{
				render json: @category
			}
		end
	end

	def create
		@category = Category.find_or_create_by(name: category_params[:name].downcase)
		redirect_to new_category_path
	end

	def autocomplete
		if params[:term]
			searchterm=params[:term].downcase
		end
		@categories = Category.order(:name).where("LOWER(name) LIKE ?", "%#{searchterm}%")
		respond_to do |format|
			format.html
			format.json{
				render json: @categories.map(&:name).to_json
			}
		end
	end

	private

	def	category_params
		params.require(:category).permit(:name)
	end
end
