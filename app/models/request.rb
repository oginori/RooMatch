class Request < ApplicationRecord
  belongs_to :resident
  belongs_to :coordinator, optional: true

  mount_uploader :room_img, ImageUploader
end
