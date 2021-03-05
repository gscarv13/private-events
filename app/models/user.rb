class User < ApplicationRecord
  has_many :events, class_name: 'Event' # This tells rails that creator on events is associated with the user_id
end