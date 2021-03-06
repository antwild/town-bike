class Booking < ApplicationRecord
  has_one :review
  belongs_to :bike
  belongs_to :rider, foreign_key: "rider_id", class_name: "User"
  validates :end_date, presence: true
  validates :start_date, presence: true

  def calculate_total
    bike = Bike.find(bike_id)
    return bike.price * ((end_date - start_date).to_i)
  end
end
