class Interior < ApplicationRecord
  belongs_to :coordinator
  has_many :favorites, dependent: :destroy
  has_many :favorite_residents, through: :favorites, source: :resident

  validates :design_img, presence: true
  validates :date_of_creation, presence: true
  validates :budget, presence: true
  validates :description, presence:true, length: { in: 1..250 } 
  
  mount_uploader :design_img, ImageUploader
end
