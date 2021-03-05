class User < ApplicationRecord
  has_many :events, class_name: 'Event', foreign_key: 'creator' # This tells rails that creator on events is associated with the user_id
end