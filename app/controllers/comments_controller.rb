class CommentsController < ApplicationController
	
	def new 
  	  @comment = Comment.new
	end

	def create 

		@project = Project.find(params[:project_id])
		@comment = Comment.new(comment_params)
		@comment.commenter = current_user
		@comment.project = @project

		if @comment.valid?
		   @comment.save 
	       redirect_to @project
		else
	    	redirect_to @project			
		end 
	end


	def edit
		@comment = Comment.find(params[:id])
	end

	def destroy 
		@comment = Comment.find(params[:id])	
		@comment.delete
		redirect_to :root	
	end
	
	def reply_form
		@comment = Comment.new
		@project = Project.find(params[:project_id])
		render :form
	end
	
	private 

    def comment_params
		params.require(:comment).permit(:content,:parent_id)
	end

end
