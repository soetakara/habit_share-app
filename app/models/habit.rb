class Habit < ApplicationRecord
  validates :title, presence: true 
  validates :item1, presence: true 

  belongs_to :user
  has_many :room_habits, dependent: :destroy
  has_many :rooms, through: :room_habits

end
