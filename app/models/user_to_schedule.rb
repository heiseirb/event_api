# == Schema Information
#
# Table name: user_to_schedules
#
#  id       :bigint           not null, primary key
#  event_id :bigint           not null
#  user_id  :bigint           not null
#

class UserToSchedule < ApplicationRecord
end
