class SessionsController < ApplicationController



  def new
    if !current_user.nil?
      flash[:danger] = 'action not permitted'
      redirect_to root_url
    end

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Welcome back " + user.username
      redirect_to root_path

    else
      flash[:danger] = 'Invalid username or password '
      render 'new'
    end

  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Logged Out "
    redirect_to root_url
  end

end
