class SeekersController < ApplicationController
  
  def new
    @seeker = Seeker.new
    
  end 
  
  def create
    @seeker = Seeker.new seeker_params
    if @seeker.save
      flash[:success] = "Account Created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @seeker = Seeker.find_by(params[:id])
  end

  def show
    @seeker = Seeker.find_by(params[:id])
  end

  def index
    @seekers = Seeker.paginate(page: params[:page], per_page: 15).order('created_at ASC')  
  end

  def update
    @seeker = Seeker.find_by(params[:id])
    if @seeker.update_attributes(seeker_params)
      flash[:success] = "Profile Updated"
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    Seeker.find_by(params[:id]).destroy
    flash[:warning] = "Account Deleted"
    redirect_to root_url
  end
  
  private
  
    def seeker_params
      params.require(:seeker).permit(:first_name, :last_name, :email, :phone, :address, :interests, 
        :about, :major, :work_experience1_title, :work_experience2_title, :work_experience3_title, 
        :work_experience1_company, :work_experience2_company, :work_experience3_company, :work_experience1_start,
        :work_experience2_start, :work_experience3_start, :work_experience1_end, :work_experience2_end, :work_experience3_end,
        :work_experience1_description, :work_experience2_description, :work_experience3_description)
    end
end
