class SessionsController < ApplicationController


  def new
    if !current_user.nil?
      flash[:danger] = 'action not permitted'
      redirect_to root_url
    end

  end

  def create

    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Welcome back #{user.email}"
      redirect_to root_url

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

  def user_params
    params.require(:session).permit(:email, :password)
  end

end
