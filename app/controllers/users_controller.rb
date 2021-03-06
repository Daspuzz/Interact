class UsersController < ApplicationController
  before_action :logged_in?, only: [:index , :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  def index
    @users=User.paginate(page: params[:page])
  end
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    
    
  end
  def new
    @user=User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      flash.now[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
  else
      render 'edit'
    end
  end
  def logged_in_user
    unless logged_in?
      store_location
      flash[:dangers] = "Please log in."
      redirect_to login_url
    end
  end
  def correct_user
    @user = User.find(params[:id]) 
    redirect_to(root_url) unless current_user?(@user)
  end

  def destroy
    # User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
   end
end
  
  
