class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :password_digest

  has_many :user_venues
  has_many :venues, through: :user_venues
end
