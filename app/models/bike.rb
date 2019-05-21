class Bike < ApplicationRecord
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :description, presence: true
  validates :make, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :bike_type, presence: true
  validates :frame_size, presence: true
  validates :location, presence: true
  validates :photo, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
