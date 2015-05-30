class User < ActiveRecord::Base
  has_many :proposal_users
  has_many :proposals
  has_many :queries, through: :proposal_users
end

class Decision < ActiveRecord::Base
  has_many :participations
  has_many :participants, through: :participations, source: :user
end

class Query < ActiveRecord::Base
  belongs_to :proposal_user
end

class Participation#ProposalUser < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :user
  has_one :query
end

class Proposal < ActiveRecord::Base
  has_many :proposal_users
  belongs_to :user

  # before_save :set_uuid

  # def set_uuid

  # end

end
