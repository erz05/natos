class JobsController < ApplicationController

	before_filter :authorize_access

	def index
		@jobs = Job.all
    end

	def new
		@job = Job.new	
	end

	def create
		@job = Job.new(params[:job].permit(:title, :description, :status))
		if @job.save
			redirect_to @job
		else
			render 'new'
		end
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		if(@job.update(params[:job].permit(:title, :description, :status)))
			redirect_to @job
		else
			render 'edit'
		end
	end

	def show
  		@job = Job.find(params[:id])
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy

		redirect_to jobs_path
	end

end
