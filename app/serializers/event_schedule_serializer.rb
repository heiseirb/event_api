class EventScheduleSerializer < ActiveModel::Serializer
  attributes :id, :status, :event_id, :user_id
end
