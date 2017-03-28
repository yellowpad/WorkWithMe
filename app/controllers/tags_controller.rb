class TagsController < ApplicationController
  def create
  	@project = Project.find(params[:project_id])
  	@category = Category.find_or_create_by(name: tag_params[:category].downcase)
  	@tag = Tag.new
  	@tag.project = @project
  	@tag.category = @category
  	if @tag.valid?
  		@tag.save
  	end
  	render json: @category, status: 201
  end

  private
  def tag_params
  	params.require(:tag).permit(:category)
  end
end
