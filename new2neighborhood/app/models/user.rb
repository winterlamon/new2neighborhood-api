class User < ApplicationRecord
  has_secure_password
  has_many :user_venues
  has_many :venues, through: :user_venues

  validates :first_name, presence: {message: "Your first name is required."}
  validates :last_name, presence: {message: "Your last name is required."}
  validates :email, uniqueness: {message: "An account with with email already exists."}, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
      message: "A valid email is required." }
  validates :password, presence: {message: "A password is required."}

end
