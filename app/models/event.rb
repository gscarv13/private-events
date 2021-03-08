class Event < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'creator'
  has_many :attendances
  has_many :attendees, through: :attendance, source: 'Attendance'
end
