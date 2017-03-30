class JobsController < ApplicationController
  def index
    @project = Project.find(jobs_params[:project_id])
    @jobs = @project.jobs.all
  end

  def show
    @job= Job.find(params[:id])
  end

  def create
    @job = Job.new(jobs_params)
    @job.project = Project.find(params[:project_id])
    #byebug
    if @job.save
      render json: @job, status: 201
    else
       render json: {errors: @job.errors}, status: 400
    end
      #render json: @job
  end

  def new 
    @job = Job.new
  end

  def edit
  end

  def update
  end

  def delete
  end
  private 
    def jobs_params
      params.require(:job).permit(:title,:description,:bounty, :project_id)
    end
end
