class Habit < ApplicationRecord
  validates :title, presence: true 
  validates :item1, presence: true 

  belongs_to :user

end
