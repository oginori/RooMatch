class Suggestion < ApplicationRecord
  belongs_to :contract
  belongs_to :coordinator
  belongs_to :request

  validates :design_img, presence: true
  validates :description, presence: true, length: { in: 1..500 } 
  validates :budget, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  mount_uploader :design_img, ImageUploader
end
