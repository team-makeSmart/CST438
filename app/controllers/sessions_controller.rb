# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    unless current_user.nil?
      flash[:danger] = 'action not permitted'
      redirect_to root_url
    end
  end

  def create
    if !is_logged_in_from_twitter
      local_login
    else
      twitter_login
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'Logged Out '
    redirect_to root_url
  end

  def is_logged_in_from_twitter
    !env['omniauth.auth'].nil?
  end

  private

  def twitter_login
    user_twitter = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user_twitter.ids[0]
    redirect_to root_url
    flash[:success] = 'Logged in from twitter '
  end

  def local_login
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
      flash[:success] = 'Welcome back ' + user.username
    else
      flash[:danger] = 'Invalid username or password '
      render 'new'
    end
  end

end
