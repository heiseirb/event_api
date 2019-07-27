# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  owner_id    :bigint           not null
#  place       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :user_to_event_schedules, dependent: :destroy
  has_many :schedules, through: :user_to_event_schedules

  validates :place, presence: true
  validates :description, presence: true
end
