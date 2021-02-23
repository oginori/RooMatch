class Request < ApplicationRecord
  belongs_to :resident
  belongs_to :coordinator, optional: true
  has_one :contract, dependent: :destroy
  has_one :suggestion

  validates :room_size, presence: true
  validates :room_img, presence: true
  validates :budget, presence: true
  validates :deadline, presence: true
  validates :remarks, presence: true, length: { in: 1..500 } 
  
  mount_uploader :room_img, ImageUploader

end
