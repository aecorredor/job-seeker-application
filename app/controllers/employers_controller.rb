class EmployersController < ApplicationController
  
  
  def new
    @employer = Employer.new
  end 
  
  def create
    @employer = Employer.new employer_params
    if @employer.save
      flash[:success] = "Account Created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @employer = Employer.find_by(params[:id])
  end

  def show
    @employer = Employer.find_by(params[:id])
  end

  def index
    @employers = Employer.paginate(page: params[:page], per_page: 15).order('created_at ASC')  
  end

  def update
    @employer = Employer.find_by(params[:id])
    if @employer.update_attributes(employer_params)
      flash[:success] = "Profile Updated"
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    Employer.find_by(params[:id]).destroy
    flash[:warning] = "Account Deleted"
    redirect_to root_url
  end
  
  private
  
    def employer_params
      params.require(:employer).permit(:company_name, :rep_fname, :rep_lname, :email, :phone, :address, :founded, :company_info)
    end
end
