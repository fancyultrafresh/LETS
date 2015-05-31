class Api::SessionsController < ApplicationController

  def create
    if user = User.find_by(email: params[:session][:email])
      user.authenticate(params[:session][:password])
      session[:user_id] = user.id
    else
      render status:500, json: {
        message: "User not found."
      }.to_json
    end
  end

  def destroy
    session.clear
    # @_current_user = session[:user_id] = nil
  end
end
