class Decision < ActiveRecord::Base
  has_many :participations
  has_many :participants, through: :participations, source: :user
  has_many :proposals, through: :participations
  # has_one  :winning_proposal, through: :participations, source: :proposal

  validates_presence_of :context


  def active_proposal
    active_proposals = self.proposals.where(status:"open")
    if active_proposals.length == 1
      active_proposals[0]
    else
      errors[:base] <<"This decision either has more than one activer proposal or has no active proposals"
    end
  end



end
