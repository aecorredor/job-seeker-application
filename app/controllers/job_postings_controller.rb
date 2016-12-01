class JobPostingsController < ApplicationController
  before_action :employer_or_admin_signed_in?, only: [:new, :create, :edit, :update, :destroy, :show]

  def new
    @job_posting = JobPosting.new
  end 
  
  def create
    @job_posting = current_employer.job_postings.build job_posting_params
    if @job_posting.save
      flash[:success] = "You Have Successfully Created A job Posting"
      if employer_signed_in? 
        redirect_to employerdashboard_path 
      else 
        redirect_to admindashboard_path
      end
    else
      render 'new'
    end
  end

  def edit
    @job_posting = JobPosting.find(params[:id])
  end

  def show
    @job_posting = JobPosting.find(params[:id])
    
    if employer_signed_in? || admin_signed_in?
      @job_applications = @job_posting.job_applications
    else
      redirect_to seekerdashboard_path
    end
  end

  def index
    @job_postings = JobPosting.paginate(page: params[:page], per_page: 15).order('created_at ASC')  
  end

  def update
    if employer_signed_in?
      @job_posting = JobPosting.find(params[:id])
      if @job_posting.update_attributes(job_posting_params)
        flash[:success] = "Job Posting Updated"
        redirect_to employerdashboard_path
      end
    elsif admin_signed_in?
      @job_posting = JobPosting.find(params[:id])
      if @job_posting.update_attributes(job_posting_params)
        flash[:success] = "Job Posting Updated"
        redirect_to admindashboard_path
      end
    else
      if employer_signed_in?
        render 'new'
      else
        redirect_to admindashboard_path
      end
    end
  end

  def destroy
    JobPosting.find(params[:id]).destroy
    flash[:warning] = "Job Posting Deleted"
    redirect_to admindashboard_path
  end
  
  private
  
    def job_posting_params
      params.require(:job_posting).permit(:position, :location, :job_type, :job_description, :pay)
    end
    
    def employer_or_admin_signed_in?
      unless employer_signed_in? || admin_signed_in?
        redirect_to root_url
      end
    end
end
