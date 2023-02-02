class Show < ApplicationRecord
  belongs_to :club
  has_many :bookings, dependent: :destroy
  has_many :show_comedians, dependent: :destroy
  has_many :users, through: :bookings
end
