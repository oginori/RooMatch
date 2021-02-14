class Contract < ApplicationRecord
  belongs_to :request
  belongs_to :coordinator
  has_one :room

  enum status: { ongoing: 1, close: 2 }
end
