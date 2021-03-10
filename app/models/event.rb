class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 45 }
  validates :date, presence: true
  validates :location, presence: true, length: { minimum: 4 }
  validates :description, preasence: true, length: { minimum: 6 }

  belongs_to :user, class_name: 'User', foreign_key: 'creator'
  has_many :attendances, class_name: 'Attendance', foreign_key: 'attended_event'
  has_many :attendees, through: :attendance, source: 'attendee'

  scope :upcomming_events, -> { where('date > ?', Time.now) }
  scope :past_events, -> { where('date < ?', Time.now) }
end
