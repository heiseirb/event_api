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
  enumerize :status, in: %w(reserved confirmed canceled), default: :reserved, scope: true, predicates: true
end
