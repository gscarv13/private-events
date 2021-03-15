class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 15 }

  has_many :events, class_name: 'Event', foreign_key: 'creator'
  has_many :attendances, class_name: 'Attendance', foreign_key: 'attendee'
  has_many :attended_events, through: :attendances, source: 'attended_event'
end
