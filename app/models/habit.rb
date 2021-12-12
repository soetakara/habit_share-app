class Habit < ApplicationRecord
  validates :title, presence: true 
  validates :item1, presence: true 

  belongs_to :user
  has_many :message_habits
  has_many :rooms, through: :message_habits

end
