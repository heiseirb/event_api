# == Schema Information
#
# Table name: event_schedules
#
#  id         :bigint           not null, primary key
#  date       :date             not null
#  capacity   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventScheduleSerializer < ActiveModel::Serializer
  attributes :id, :status, :event_id, :user_id
end
