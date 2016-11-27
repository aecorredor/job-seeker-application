class JobApplicationlicationsController < ApplicationController
  
  
  def new
    @job_application = JobApplication.new
  end 
  
  def create
    @job_application = JobApplication.new job_application_params
    if @job_application.save
      flash[:success] = "You Have Successfully Applied"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @job_application = JobApplication.find_by(params[:id])
  end

  def show
    @job_application = JobApplication.find_by(params[:id])
  end

  def index
    @job_applications = JobApplication.paginate(page: params[:page], per_page: 15).order('created_at ASC')  
  end

  def update
    @job_application = JobApplication.find_by(params[:id])
    if @job_application.update_attributes(job_application_params)
      flash[:success] = "Cover Letter Updated"
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    JobApplication.find_by(params[:id]).destroy
    flash[:warning] = "Application Deleted"
    redirect_to root_url
  end
  
  private
  
    def job_application_params
      params.require(:JobApplication).permit(:cover_letter)
    end
end
