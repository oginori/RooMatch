class Request < ApplicationRecord
  belongs_to :resident
  belongs_to :coordinator, optional: true
  has_one :suggestion

  mount_uploader :room_img, ImageUploader
end
