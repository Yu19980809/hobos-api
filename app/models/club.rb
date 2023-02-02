class Club < ApplicationRecord
  belongs_to :user
  has_many :shows, dependent: :destroy
  has_many :club_followings, dependent: :destroy
end
