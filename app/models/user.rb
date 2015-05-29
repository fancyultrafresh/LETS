class User < ActiveRecord::Base
  has_many :proposal_users
  has_many :proposals
  has_many :queries, through: :proposal_users
end
