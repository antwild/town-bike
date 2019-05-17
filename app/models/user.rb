class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bikes
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => Devise::email_regexp
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :about_me, presence: true
  # validates :encrypted_password, presence: true, confirmation: true, length: {:within => 6..40}, on: :create
end
