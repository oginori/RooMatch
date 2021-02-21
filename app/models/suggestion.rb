class Suggestion < ApplicationRecord
  belongs_to :contract
  belongs_to :coordinator
  belongs_to :request

  validates :design_img, presence: true
  validates :description, presence: true, length: { in: 1..500 } 
  validates :budget, presence: true

  mount_uploader :design_img, ImageUploader
end
