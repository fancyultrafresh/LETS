class Api::ParticipationsController < ApplicationController
  # respond_to :json

  def index
    render json: Decision.find(params[:decision_id]).participations
    # render json: Participation.where(user_id: params[:user_id])
  end

  def show

  end

  def default_serializer_options
    { root: false }
  end

end
