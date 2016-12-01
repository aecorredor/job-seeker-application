class EmployersController < ApplicationController
  def new
    @employer = Employer.new
  end 

  def edit
    if employer_signed_in?
      if Employer.find(params[:id]) == current_employer
        @employer = Employer.find(params[:id])
      else 
        redirect_to employerdashboard_path
      end
    elsif admin_signed_in?
        @employer = Employer.find(params[:id])  
    else
      redirect_to root_path
    end
  end

  def show
    @employer = Employer.find(params[:id])
  end

  def index
    @employers = Employer.all
  end

  def update
    @employer = Employer.find(params[:id])
    if employer_signed_in?
      if @employer.update_attributes(employer_params)
        flash[:success] = "Profile Updated"
        redirect_to employerdashboard_path
      end
    elsif admin_signed_in?
      if @employer.update_attributes(employer_params)
        flash[:success] = "Profile Updated"
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
    Employer.find(params[:id]).destroy
    flash[:warning] = "Account Deleted"
    redirect_to admindashboard_path
  end
  
  private
  
    def employer_params
      params.require(:employer).permit(:company_name, :rep_fname, :rep_lname, :email, :phone, :address, :founded, :company_info, :password_digest)
    end
end
