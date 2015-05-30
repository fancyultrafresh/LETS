class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :decision
  has_many   :proposals
  has_many   :queries
end
