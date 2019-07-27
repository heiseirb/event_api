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
  has_many :event_schedules, dependent: :destroy

  validates :place, presence: true
  validates :description, presence: true

  scope :with_relation, -> do
    includes(
      :owner,
      :event_schedules
    )
  end
end
