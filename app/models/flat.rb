class Flat < ApplicationRecord
  # reference to the user model. user_id and user (id)
  include PgSearch::Model
  pg_search_scope :search_by_location, against: :address, using: { tsearch: {
    prefix: true
  } }
end
