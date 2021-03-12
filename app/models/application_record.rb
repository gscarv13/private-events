class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :upcomming_events, -> { where('date > ?', Time.now) }
  scope :past_events, -> { where('date < ?', Time.now) }
end
