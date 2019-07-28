# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  role            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  extend Enumerize
  has_secure_password

  has_many :owner_events, class_name: 'Event', dependent: :destroy, foreign_key: 'owner_id'
  has_many :user_to_event_schedules, dependent: :destroy
  has_many :join_schedules, through: :user_to_event_schedules, class_name: 'EventSchedule', source: 'event_schedule'

  validates :name, :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: true
  validates :password, length: { minimum: 8 }
  enumerize :role, in: %w(owner normal), default: :normal, scope: true, predicates: true

  scope :with_relation, -> do
    includes(
      { owner_events: :schedules },
      { join_schedules: :event }
    )
  end
end
