class Contract < ApplicationRecord
  belongs_to :request
  belongs_to :coordinator
  has_one :room

  enum approval: { pending: 0, concluded: 1, failure: 2 }
  enum status: { ongoing: 1, close: 2 }
end
