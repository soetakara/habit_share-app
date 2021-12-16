class Message < ApplicationRecord
  attr_accessor :habit_id
  validates :comment, presence: true 

  belongs_to :room
  belongs_to :user

end
