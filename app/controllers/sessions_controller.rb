class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'Login Successful'
      redirect_to root_path
    else
      flash[:alert] = 'User not found'
      render :new
    end
  end

  def login; end

  def destroy
    reset_session
    flash[:notice] = 'Log Out Successful'
    redirect_to root_path
  end
end
