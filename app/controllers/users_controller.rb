class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create

    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        log_in @user
        flash[:success] = "Welcome to Expense Tracker "+ @user.username
        format.html {redirect_to root_path}
        format.json {render :show, status: :created, location: @user}
      else
        format.html {render :new}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
