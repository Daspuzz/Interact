class MicropostsController < ApplicationController
  before_action :logged_in? , only: [:create, :destroy]
  skip_before_action :verify_authenticity_token, :only => [:create,:destroy]
  def create
    @micropost = current_user.microposts.build(micropost_params) 
    if @micropost.save
      flash[:success] = "Micropost created!"
      render 'static_pages2/home'
    else
      flash.now[:empty]= "please fill the form"
      render 'static_pages2/home'
    end
  end
  

  def destroy
  end
  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
