# == Schema Information
#
# Table name: user_to_event_schedules
#
#  id                :bigint           not null, primary key
#  event_schedule_id :bigint           not null
#  user_id           :bigint           not null
#  status            :string           not null
#

class UserToEventSchedule < ApplicationRecord
  belongs_to :event_schedule
  belongs_to :user
  enumerize :status, in: %w(accepted), default: :accepted, scope: true, predicates: true
end
