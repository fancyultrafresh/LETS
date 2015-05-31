class DecisionSerializer < ActiveModel::Serializer
  attributes :context, :is_active, :proposals
  # has_many :participations
  # has_many :proposals
  has_many :participants
end
