class Query < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :participation
  has_one    :user, through: :participation

  # validates_presence_of :participation_id, :status#, :respond_by, :responded_at
  # validates_inclusion_of :status, :in => %w(yes no meh)
end
