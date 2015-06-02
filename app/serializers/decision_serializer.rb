class DecisionSerializer < ActiveModel::Serializer
  attributes :context, :is_active#, :proposals
  # has_many :participations
  # has_many :proposals
  has_many :participants
end


###### I ENDED UP THROWING THIS INTO THE DECISIONS CONTROLLER
# class BigObjectSerializer
#   # ATTRIBUTES = {
#   #   decision: [:id, :context, :is_active],
#   #   proposal: [:proposed_idea, :status],
#   #   participation: [:id, :name, :user[:name, :email, :phone_number]]
#   # }

#   def self.build(decision)
#     puts "HI LOGAN!!!!!!!!!!!!!!!!!!!"
#   #   data = {}
#   #   data = data.merge(decision.slice(*ATTRIBUTES[:decision]))
#   #   data[:proposals] = decision.proposals.map do |prop|
#   #     prop_data = {}
#   #     prop_data = prop_data.merge(prop.slice(*ATTRIBUTES[:proposal]))
#   #     prop_data[:user] = prop.user.slice(*ATTRIBUTES[:user])
#   #   end
#   #   data
#   end
# end

# render json: BigObjectSerializer.build(decision)


class CheckQueries
  def self.check
    Query.where(status: :open).where('respond_by < now()').each do |q|
      q.approve!
    end
  end
end
