class Bike < ApplicationRecord
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  validates :description, presence: true
  validates :make, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :type, presence: true
  validates :frame_size, presence: true
  validates :foldable, presence: true
  validates :location, presence: true
end
