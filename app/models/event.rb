class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 45 }
  validates :date, presence: true
  validates :location, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 6 }

  belongs_to :user, class_name: 'User', foreign_key: 'creator'
  has_many :attendances, class_name: 'Attendance', foreign_key: 'attended_event'
  has_many :attendees, through: :attendances, source: 'attendee'
end
