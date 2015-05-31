class SessionsController < ApplicationController

  def create
    if @user = User.find_by(username: params[:session][:username])
      @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def destroy
    session.clear
  end
end
