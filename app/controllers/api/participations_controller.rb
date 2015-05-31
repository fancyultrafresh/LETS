class Api::ParticipationsController < ApplicationController
  # respond_to :json
    skip_before_filter :verify_authenticity_token #rack-cors shite


  def index
    render json: Decision.find(params[:decision_id]).participations
    # render json: Participation.where(user_id: params[:user_id])
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user
      user.decisions << Decision.find(params[:decision_id])
      render json: {
        status: 200,
        message: "User added to Decision!"
      }.to_json
    else
      render status:500, json: {
        message: "User not found."
      }.to_json
    end
  end

  def destroy

  end

  def default_serializer_options
    { root: false }
  end


  # private
  # def participation_params
  #   params.require(:participation).permit(:email,:phone_number)
  # end

end
