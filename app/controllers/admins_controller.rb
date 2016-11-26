class AdminsController < ApplicationController
  
  
  def new
    @admin = Admin.new
  end 
  
  def create
    @admin = Admin.new admin_params
    if @admin.save
      flash[:success] = "Account Created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @admin = Admin.find_by(params[:id])
  end

  def show
    @admin = Admin.find_by(params[:id])
  end

  def index
    @admins = Admin.paginate(page: params[:page], per_page: 15).order('created_at ASC')  
  end

  def update
    @admin = Admin.find_by(params[:id])
    if @admin.update_attributes(admin_params)
      flash[:success] = "Profile Updated"
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    Admin.find_by(params[:id]).destroy
    flash[:warning] = "Account Deleted"
    redirect_to root_url
  end
  
  private
  
    def admin_params
      params.require(:admin).permit(:first_name, :last_name, :email, :phone, :address, :information)
    end
end
