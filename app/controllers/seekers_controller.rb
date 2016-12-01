class SeekersController < ApplicationController
  def show
    @seeker = Seeker.find(params[:id])
  end
  
  def edit
    if seeker_signed_in?
      if Seeker.find(params[:id]) == current_seeker
        @seeker = Seeker.find(params[:id])
      else
        redirect_to seekerdashboard_path
      end
    elsif admin_signed_in?
      @seeker = Seeker.find(params[:id])
    else
      redirect_to root_path
    end
  end
  
  def index
    @seekers = Seeker.all
  end
  
  def update
    if seeker_signed_in?
      @seeker = Seeker.find(params[:id])
      if @seeker.update_attributes(seeker_params)
        flash[:success] = "Profile Updated"
        redirect_to seekerdashboard_path
      end
    elsif admin_signed_in?
      @seeker = Seeker.find(params[:id])
      if @seeker.update_attributes(seeker_params)
        flash[:success] = "Profile Updated"
        redirect_to admindashboard_path
      end
    else
      if seeker_signed_in?
        render 'edit'
      else
        redirect_to admindashboard_path
      end
    end
  end
  
  def destroy
    Seeker.find(params[:id]).destroy
    flash[:warning] = "Account Deleted"
    redirect_to admindashboard_path
  end
  
    def seeker_params
      params.require(:seeker).permit(:first_name, :last_name, :email, :phone, :address, :interests,
        :about, :major, :work_experience1_title, :work_experience2_title, :work_experience3_title, 
        :work_experience1_company, :work_experience2_company, :work_experience3_company, :work_experience1_start,
        :work_experience2_start, :work_experience3_start, :work_experience1_end, :work_experience2_end, :work_experience3_end,
        :work_experience1_description, :work_experience2_description, :work_experience3_description, :university)
    end
end
