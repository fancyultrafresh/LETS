class Proposal < ActiveRecord::Base
  has_many :proposal_users
  belongs_to :user
end
