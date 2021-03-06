class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to '/users/index'
    else
      render :new
    end
  end

  def show
    @user = current_user
    @future_ev = current_user.attended_events.upcomming_events
    @past_ev = current_user.attended_events.past_events
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
