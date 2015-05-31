class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :phone_number
  has_many :participations
end
