class Room < ApplicationRecord
  belongs_to :resident
  belongs_to :coordinator
  belongs_to :contract
  has_many :messages, dependent: :destroy
end
