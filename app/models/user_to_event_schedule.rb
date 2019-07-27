# == Schema Information
#
# Table name: user_to_event_schedules
#
#  id                :bigint           not null, primary key
#  event_schedule_id :bigint           not null
#  user_id           :bigint           not null
#  status            :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class UserToEventSchedule < ApplicationRecord
  belongs_to :event_schedule
  belongs_to :user
  enumerize :status, in: %w(reserved confirmed), default: :reserved, scope: true, predicates: true

  before_create :can_aplay?

  private
  
  def can_aplay?
    throw(:abort) if event_schedule.event.owner_id == user_id
  end
end
