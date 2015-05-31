class Proposal < ActiveRecord::Base
  belongs_to :participation
  has_one    :proposer, through: :participation, source: :user
  has_one    :decision, through: :participation
  has_many   :queries

  validates_presence_of :status, :proposed_idea, :participation_id
  # validates_inclusion_of :status, :in => %w(yes no open canceled)
end
