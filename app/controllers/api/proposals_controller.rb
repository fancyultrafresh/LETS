class Api::ProposalsController < ApplicationController

  WAIT_TIME = 15 * 60

  skip_before_filter :verify_authenticity_token

  # this route/action is only called when a new decision is made and a first proposal is made for the decision
  def create
    prop = Proposal.new(status: 'open', proposed_idea: params[:proposed_idea], participation_id: params[:participation_id])

    user = User.find_by(id: params[:id])

    if prop.save
      Query.create(participation_id: params[:participation_id], status: "yes", respond_by: Time.now + WAIT_TIME)

      render status:200, json: {
        message: "Proposal created"
      }.to_json
    else
      render status:500, json: {
        message: "Error creating proposal"
      }.to_json
    end

  end

  def update
    prop = Proposal.find_by(id: params[:proposal_id])

    prop.update_attribtues(status: params[:status])
  end

end
