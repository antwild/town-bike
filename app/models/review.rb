class Review < ApplicationRecord
  validates :stars, presence: true, inclusion: 0..5
  validates :description, presence: true
end
