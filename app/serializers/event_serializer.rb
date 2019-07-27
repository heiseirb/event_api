class EventSerializer < ActiveModel::Serializer
  attributes :id, :owner_id, :place, :description
  
  belongs_to :owner
  has_many :schedules
end
