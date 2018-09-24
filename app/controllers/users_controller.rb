class UsersController < ApplicationController

  def newanother
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def showanother
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create2
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      log_in @user
      flash[:success] = "Welcome to cai dit con me may!!!"
      redirect_to user_url(@user)
    else
      render 'newanother'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!!"
      redirect_to @user
    else
      render 'new'
    end
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

