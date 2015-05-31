class ParticipationSerializer < ActiveModel::Serializer
  attributes :id#, :user
  # has_many :proposals
  belongs_to :decision
  belongs_to :user
end
