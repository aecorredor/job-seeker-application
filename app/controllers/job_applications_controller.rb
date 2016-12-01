class JobApplicationsController < ApplicationController
  before_action :seeker_or_admin_signed_in?, only: [:new, :create, :edit, :update, :destroy]
  
  
  def new
    @job_application = JobApplication.new
    @job_posting = JobPosting.find job_application_params[:job_posting_id]
  end 
  
  def create
    @job_posting = JobPosting.find job_application_params[:job_posting_id]
    @job_application = current_seeker.job_applications.build job_application_params 
    if @job_application.save
      flash[:success] = "You Have Successfully Applied"
      if seeker_signed_in? 
        redirect_to seekerdashboard_path 
      else 
        redirect_to admindashboard_path
      end
    else
      render 'new'
    end
  end

  def edit
    @job_application = JobApplication.find params[:id]
    @job_posting = JobPosting.find(@job_application.job_posting_id)
  end

  def show
    @job_application = JobApplication.find params[:id]
  end

  def index
    @job_applications = JobApplication.all
  end

  def update
    @job_application = JobApplication.find params[:id]
    if @job_application.update_attributes(job_application_params)
      flash[:success] = "Cover Letter Updated"
      if seeker_signed_in? 
        redirect_to seekerdashboard_path 
      else 
        redirect_to admindashboard_path
      end
    else
      render "new"
    end
  end

  def destroy
    JobApplication.find(job_application_params[:id]).destroy
    flash[:warning] = "Application Deleted"
    redirect_to root_url
  end
  
  private
  
    def job_application_params
      params.require(:job_application).permit(:cover_letter, :job_posting_id)
    end
    
    def seeker_or_admin_signed_in?
      unless seeker_signed_in? || admin_signed_in?
        redirect_to root_url
      end
    end
end
