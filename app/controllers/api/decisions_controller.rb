class Api::DecisionsController < ApplicationController

# respond_to :json
  skip_before_filter :verify_authenticity_token #rack-cors shite

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

  def create
    user = User.find(params[:user_id])
    decision = user.decisions.new(decision_params)

    if decision.save
      Participation.create(user: user, decision: decision)
      head 200
    else
      head 500
    end
  end

  def default_serializer_options
    { root: false }
  end

  private
  def decision_params
    params.require(:decision).permit(:context)
  end
end
