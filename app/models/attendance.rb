class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User', foreign_key: 'attendee'
  belongs_to :attended_event, class_name: 'Event', foreign_key: 'attended_event'
end
