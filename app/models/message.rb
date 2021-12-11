class Message < ApplicationRecord
  validates :comment, presence: true 

  belongs_to :room
  belongs_to :user
end
