class ProjectsController < ApplicationController

	def new
		@project = Project.new
	end

	def index
		@projects = Project.all
	end

	def create
		byebug
		@project = Project.new(project_params)
		@project.account = current_user
		if @project.valid?
		  @project.save
		  redirect_to @project
		else
		  render :new
		end
	end

	def show
		@project = Project.find(params[:id])
		@comment = Comment.new
		@job = Job.new
		@jobs = Job.all
		@tag = Tag.new
		@like = Like.find_or_create_by(project_id: @project.id, account_id: current_user.id)
		respond_to do |format|
			format.html
			format.json{
				render json: @project
			}
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def destroy
		@project = Project.find(params[:id])
		@project.delete
		redirect_to :root
	end

	def reply_form

		@comment = Comment.new
		@project = Project.find(params[:id])

		render :layout => false

	end

	private

      def project_params
		params.require(:project).permit(:name,:description)
	  end
end
