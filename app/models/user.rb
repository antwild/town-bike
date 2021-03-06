class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # owner
  has_many :bikes, foreign_key: :owner_id
  has_many :bike_bookings, through: :bikes, source: :bookings
  has_many :bike_reviews, through: :bike_bookings, source: :review

  # rider
  has_many :bookings, foreign_key: :rider_id
  has_many :reviews, through: :booking
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: Devise.email_regexp
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :about_me, presence: true
  # validates :encrypted_password, presence: true, confirmation: true, length: {:within => 6..40}, on: :create
end
