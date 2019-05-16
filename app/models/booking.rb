class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :rider, foreign_key: "rider_id", class_name: "User"
end
