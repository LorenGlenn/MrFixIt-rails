class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @user = current_user
   @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @user = current_user
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if current_worker
      if params[:pending]
        @job.update(pending: true, worker_id: current_worker.id)
        respond_to  do |format|
        format.html { redirect_to job_path(@job.id) }
        format.js
        end
      elsif params[:working]
        @job.update(pending: false)
        respond_to  do |format|
        format.html { redirect_to job_path(@job.id) }
        format.js
        end
      elsif params[:completed]
        @job.update(completed: true)
        respond_to  do |format|
        format.html { redirect_to job_path(@job.id) }
        format.js
        end
      else
        render :show
        flash[:notice] = "Something went wrong!"
      end
    else
      # We need to streamline this process better in the future! - Mr. Fix-It.
      flash[:notice] = 'You must have a worker account to claim a job. Register for one using the link in the navbar above.'
      redirect_to job_path(@job)
    end
  end

private

  def job_params
    params.require(:job).permit(:title, :description, :user_id)
  end

end
