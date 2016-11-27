class JobPostingsController < postingController
  
  
  def new
    @job_posting = JobPosting.new
  end 
  
  def create
    @job_posting = JobPosting.new job_posting_params
    if @job_posting.save
      flash[:success] = "You Have Successfully Applied"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @job_posting = JobPosting.find_by(params[:id])
  end

  def show
    @job_posting = JobPosting.find_by(params[:id])
  end

  def index
    @job_postings = JobPosting.paginate(page: params[:page], per_page: 15).order('created_at ASC')  
  end

  def update
    @job_posting = JobPosting.find_by(params[:id])
    if @job_posting.update_attributes(job_posting_params)
      flash[:success] = "Cover Letter Updated"
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    JobPosting.find_by(params[:id]).destroy
    flash[:warning] = "posting Deleted"
    redirect_to root_url
  end
  
  private
  
    def job_posting_params
      params.require(:Jobposting).permit(:position, :location, :job_type, job_description, :pay)
    end
end
