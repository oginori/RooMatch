class Message < ApplicationRecord
  belongs_to :room
  belongs_to :sender, foreign_key: :sender_id, class_name: 'Resident'
  belongs_to :sender, foreign_key: :sender_id, class_name: 'Coordinator'

  validates_presence_of :body, :room_id, :sender_id

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
