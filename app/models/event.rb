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
end
