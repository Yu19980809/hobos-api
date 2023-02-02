class User < ApplicationRecord
  # for comdian
  has_many :show_comedians, dependent: :destroy

  #for manager
  has_many :clubs

  # for all users
  has_many :bookings, dependent: :destroy
  has_many :shows, through: :bookings
  has_many :club_followings, dependent: :destroy
  has_many :comedian_followings, dependent: :destroy
end
