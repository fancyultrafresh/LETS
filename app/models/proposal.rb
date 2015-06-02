class Proposal < ActiveRecord::Base
  belongs_to :participation
  has_many   :queries

  def proposer
    @_proposer ||= self.participation.user
  end

  def decision
    @_decision ||= self.participation.decision
  end

  def participations
    @_participations ||= self.decision.participations
  end

  def voters
    @_voters ||= self.queries.pluck(:participation_id).sort.map {|id| Participation.find(id)}
  end

  def not_yet_voted

  end

  def ordered_participations

  end

  def next_voter

  end


  validates_presence_of :status, :proposed_idea, :participation_id
  # validates_inclusion_of :status, :in => %w(accepted refused open)

end
