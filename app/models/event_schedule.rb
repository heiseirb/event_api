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

class EventSchedule < ApplicationRecord
  belongs_to :event
  has_many :user_to_event_schedules, dependent: :destroy
  has_many :users, through: :user_to_event_schedules

  validates :date, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :with_relation, -> do
    includes(
      :event,
      :users
    )
  end

  def lottery
    user_to_event_schedules.update_all(status: :confirmed) if capacity < users.count
    loop do
      reserved_user_count = user_to_event_schedules.where(status: :reserved).count
      break if capacity == reserved_user_count

      vacancy_num = capacity - reserved_user_count
      target_users = user_to_event_schedules.where(status: :reserved).order('random()').limit(vacancy_num)

      break if target_users.count.zero?

      target_users.update_all(status: :confirmed)
    end
    self
  end
end
