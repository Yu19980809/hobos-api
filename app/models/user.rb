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

  validates :nickname, presence: true, uniqueness: true, length: { minimum: 2, maximum: 8, message: '长度为2~8个字符' }
  validates :role, presence: true, inclusion: { in: %w(audience comedian manager), message: "%{value} is not a valid role" }
  validates :slogan, length: { maximum: 16, message: '最长为16个字符' }
  validates :experience, length: { maximum: 128, message: '最长为128个字符' }
end
