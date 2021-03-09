class User < ApplicationRecord
  has_many :events, class_name: 'Event', foreign_key: 'creator'
  has_many :attendances, class_name: 'Attendance', foreign_key: 'attendee'
  has_many :attended_events, through: :attendance, source: 'attended_event'
end
