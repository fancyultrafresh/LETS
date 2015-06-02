class Api::DecisionsController < ApplicationController

# respond_to :json
  skip_before_filter :verify_authenticity_token #rack-cors shite

  def index
    render json: User.find(params[:user_id]).decisions
    # render json: Participation.where(user_id: params[:user_id])
  end

  def show
    render json: BigObjectSerializer.build(Decision.find(params[:id]))
    # decision = Decision.find(params[:id])
    # render json: decision#.to_json(include: :participations)#.as_json(include: :proposals)
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


class BigObjectSerializer
  ATTRIBUTES = {
    decision: [:context, :is_active],
    active_proposal: [:proposed_idea, :status,:participation_id],
    participation: [:id, :name]# , :user[:name, :email, :phone_number]??
  }

  def self.build(decision)
    data = {}

    active_proposal = decision.active_proposal
    voters = active_proposal.queries.pluck(:participation_id).sort.map {|id| Participation.find(id)}
    non_voters = (active_proposal.participations - voters).sort
    ordered_participations = non_voters + voters


    data = data.merge(decision.slice(*ATTRIBUTES[:decision]))
    data[:active_proposal] = active_proposal.slice(*ATTRIBUTES[:active_proposal])
    # data[:proposals] = decision.proposals.map do |prop|
    #   prop_data = {}
    #   prop_data = prop_data.merge(prop.slice(*ATTRIBUTES[:proposal]))
    #   prop_data[:user] = prop.user.slice(*ATTRIBUTES[:user])
    # end
    data
  end
end
