class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    forwarding_url = session[:forwarding_url]
    if user && user.authenticate(params[:session][:password])
      reset_session
      # params[:session][:remember_me] == '1' ? remember(user) : forget(user) 
      # remember user
      log_in(user)
      redirect_to forwarding_url || user
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      puts "in else"
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    
    log_out

    redirect_to root_url
  end

end
