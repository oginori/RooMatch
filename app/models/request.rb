class Request < ApplicationRecord
  belongs_to :resident
  belongs_to :coordinator, optional: true
  has_many :contracts, dependent: :destroy
  has_one :suggestion

  mount_uploader :room_img, ImageUploader
end
