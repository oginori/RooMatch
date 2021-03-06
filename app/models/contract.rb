class Contract < ApplicationRecord
  belongs_to :request
  belongs_to :coordinator
  has_one :suggestion, dependent: :destroy
  has_one :room, dependent: :destroy

  validates :coordinator_id, uniqueness: { scope: :request_id }

  enum status: { ongoing: 1, close: 2 }
end
