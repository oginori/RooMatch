class Suggestion < ApplicationRecord
  belongs_to :contract
  belongs_to :coordinator
  belongs_to :request

  mount_uploader :design_img, ImageUploader
end
