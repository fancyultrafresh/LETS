class Proposal < ActiveRecord::Base
  belongs_to :participation
  has_one    :proposer, through: :participation, source: :user
  has_one    :decision, through: :participation
  has_many   :queries
end
