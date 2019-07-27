class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role

  has_many :owner_events
  has_many :join_events
end
