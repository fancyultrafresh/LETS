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
      head 200
    else
      head 455
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
