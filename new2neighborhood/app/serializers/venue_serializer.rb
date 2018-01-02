class VenueSerializer < ActiveModel::Serializer
  attributes :name, :address, :city, :state, :postalCode, :lat, :lng, :category, :description, :url

  has_many :user_venues
  has_many :users, through: :user_venues
end
