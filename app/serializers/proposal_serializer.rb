class ProposalSerializer < ActiveModel::Serializer
  attributes :id, :proposed_idea, :status
end
