class User < ActiveRecord::Base
  has_many :participations
  has_many :decisions, through: :participations
  has_many :proposals, through: :participations
  has_many :queries, through: :participations
end
