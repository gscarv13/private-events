class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
    end
  end

  def login; end

  def destroy
    reset_session
    redirect_to root_path
  end
end
