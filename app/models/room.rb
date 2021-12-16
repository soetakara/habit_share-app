class Room < ApplicationRecord
  validates :name, presence: true 

  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :room_habits, dependent: :destroy
  has_many :habits, through: :room_habits

end
