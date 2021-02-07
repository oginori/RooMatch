class Interior < ApplicationRecord
  belongs_to :coordinator
  has_many :favorites, dependent: :destroy
  has_many :favorite_residents, through: :favorites, source: :resident
end
