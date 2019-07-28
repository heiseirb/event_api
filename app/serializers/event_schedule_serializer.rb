# == Schema Information
#
# Table name: event_schedules
#
#  id         :bigint           not null, primary key
#  event_id   :bigint           not null
#  date       :date             not null
#  capacity   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventScheduleSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :date, :capacity, :users

  def users
    {
      confirmed_user_ids: object.user_to_event_schedules.where(status: :confirmed).map(&:user_id),
      reserved_user_ids: object.user_to_event_schedules.where(status: :reserved).map(&:user_id)
    }
  end
end
