class JobsController < ApplicationController
  def index
    @project = Project.find(jobs_params[:project_id])
    @jobs = @project.jobs.all
  end

  def show
    @job= Job.find(params[:id])
  end

  def create
    project = Project.find(params[:project_id])
    if project.account == current_user
      @job = Job.new(job_params)
      @job.project = project
      if @job.valid?
        @job.save
        render json: @job, status: 201
      else
        render json: {errors: @job.errors}, status: 400
      end
    else
      render json: {errors: "fucked up, this isn't your project bruh"}, status: 400
    end
  end

  def new
    @job = Job.new
  end

  private
    def job_params
      params.require(:job).permit(:title,:description,:bounty)
    end
end
