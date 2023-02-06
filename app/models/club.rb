class Club < ApplicationRecord
  belongs_to :user
  has_many :shows, dependent: :destroy
  has_many :club_followings, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 8, message: '长度为2~8个字符' }
  validates :address, presence: true, length: { maximum: 16, message: '最长为16个字符' }
  validates :description, presence: true, length: { maximum: 128, message: '最长为128个字符' }
end
