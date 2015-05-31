class Api::DecisionsController < ApplicationController
  skip_before_filter :verify_authenticity_token #rack-cors shite
  # respond_to :json

  def index
    render json: User.find(params[:user_id]).decisions
    # render json: Participation.where(user_id: params[:user_id])
  end

  def show
    decision = Decision.find(params[:id])
    render json: decision#.to_json(include: :participations)#.as_json(include: :proposals)
  end

  def activeproposal
    render json: Decision.find(params[:id]).proposals.find_by_status("open")
  end

  def default_serializer_options
    { root: false }
  end

end
