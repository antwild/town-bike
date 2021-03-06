class Review < ApplicationRecord
  belongs_to :booking
  validates :stars, presence: true, inclusion: 0..5
  validates :description, presence: true
end
