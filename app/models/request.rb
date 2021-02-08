class Request < ApplicationRecord
  belongs_to :resident
  belongs_to :coordinator

  mount_uploader :room_img, ImageUploader
end
