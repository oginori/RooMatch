class Contract < ApplicationRecord
  belongs_to :request
  belongs_to :coordinator
  belongs_to :resident
  has_one :room

  enum status: { ongoing: 1, close: 2 }
end
