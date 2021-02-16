class Request < ApplicationRecord
  belongs_to :resident
  belongs_to :coordinator, optional: true
  has_one :contract, dependent: :destroy
  accepts_nested_attributes_for :contract
  has_one :suggestion

  mount_uploader :room_img, ImageUploader
end
