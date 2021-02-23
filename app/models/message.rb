class Message < ApplicationRecord
  belongs_to :room
  belongs_to :sender, foreign_key: :sender_id, class_name: 'Resident'
  belongs_to :sender, foreign_key: :sender_id, class_name: 'Coordinator'

  validates_presence_of :content, :room_id, :sender_id
  validates :content, length: { in: 1..500 } 

  def message_time
    created_at.strftime("%Y/%m/%d %p %l:%M")
  end
end
