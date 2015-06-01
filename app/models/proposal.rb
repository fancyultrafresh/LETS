class Proposal < ActiveRecord::Base
  belongs_to :participation
  has_many   :queries

  def proposer
    @_proposer ||= self.participation.user
  end

  def decision
    @_decision ||= self.participation.decision
  end
end
