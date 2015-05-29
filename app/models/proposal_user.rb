class ProposalUser < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :user
  has_one :query
end
