class Message < ApplicationRecord
  validates :comment, presence: true 

  belongs_to :room
  belongs_to :user
  has_many :message_habits
  has_many :habits, through: :message_habits
end
