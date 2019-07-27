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

class EventSchedule < ApplicationRecord
  belongs_to :event
  has_many :user_to_event_schedules, dependent: :destroy
  has_many :users, through: :user_to_event_schedules

  validates :date, presence: true
  validates :capacity, presence: true, numericality: true, greater_than_or_equal_to: 0

  scope :with_relation, -> do
    includes(
      :event,
      :users
    )
  end

  def lottery
    user_to_event_schedules.update_all(status: :confirmed) if capacity < users.count
    loop do
      break if capacity == users.count

      user_to_event_schedules.where(status: :reserved).sample.update!(status: :confirmed)
    end
    self
  end
end
