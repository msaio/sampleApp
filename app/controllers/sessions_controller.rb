class SessionsController < ApplicationController
  def anothernew
  end
 
  def anothercreate
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # flash.now[:success] = "Successfull log in <3"
      # render 'anothernew'
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid user/password"
      render 'anothernew'
    end
  end

  def new
  end

  def successfullogin
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # flash.now[:success] = "Successfull log in <3"
      # render 'new'
      # redirect_to root_path
      log_in user
      # redirect_to user
      redirect_to user_url(user)
    else
      flash.now[:danger] = "Invalid email/password combination" 
      render 'new'
    end
  end

  def destroy
  end

end
