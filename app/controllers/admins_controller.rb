class AdminsController < ApplicationController
  
  
  def new
    @admin = Admin.new
  end 

  def edit
    if admin_signed_in?
      if Admin.find(params[:id]) == current_admin
        @admin = Admin.find(params[:id])
      else
        redirect_to admindashboard_path
      end
    else
      redirect_to root_path
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def index
    @admins = Admin.paginate(page: params[:page], per_page: 15).order('created_at ASC')  
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      flash[:success] = "Profile Updated"
      redirect_to admindashboard_path
    else
      render "new"
    end
  end

  def destroy
    Admin.find(params[:id]).destroy
    flash[:warning] = "Account Deleted"
    redirect_to root_url
  end
  
  private
  
    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :phone, :address, :information, :password_digest)
    end
end
