class Flat < ApplicationRecord
  # reference to the user model. user_id and user (id)
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true
  belongs_to :user
end
