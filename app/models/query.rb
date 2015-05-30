class Query < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :participation
  has_one    :user, through: :participation
end
