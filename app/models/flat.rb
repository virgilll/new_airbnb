class Flat < ApplicationRecord
  # reference to the user model. user_id and user (id)
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true
  belongs_to :user
  has_many :bookings

  include PgSearch::Model
  pg_search_scope :search_by_location, against: :address, using: { tsearch: {
    prefix: true
  } }
end
