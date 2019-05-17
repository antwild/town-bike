class Review < ApplicationRecord
  belongs_to :bike
  belongs_to :rider, foreign_key: "rider_id", class_name: "User"
  validates :stars, presence: true
  validates :description, presence: true
end
