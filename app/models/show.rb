class Show < ApplicationRecord
  has_one_attached :poster

  belongs_to :club
  has_many :bookings, dependent: :destroy
  has_many :show_comedians, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, presence: true, length: { minimum: 2, maximum: 8, message: '长度为2~8个字符' }
  validates :description, presence: true, length: { minimum: 2, maximum: 128, message: '长度为2~128个字符' }
  validates :date, presence: true, format: { with: /\d{4}\/\d{2}\/\d{2}/, message: 'format is YYYY/MM/DD' }
  validates :start_time, presence: true, format: { with: /\d{2}:\d{2}/, message: 'format is HH:MM' }
  validates :end_time, presence: true, format: { with: /\d{2}:\d{2}/, message: 'format is HH:MM' }
  validates :address, presence: true, length: { minimum: 2, maximum: 16, message: '长度为2~16个字符' }
end
