class User < ApplicationRecord
  has_many :events, class_name: 'Event', foreign_key: 'creator'
  has_many :attendances
  has_many :attended_events, through: :attendance, source: 'Attendance'
end