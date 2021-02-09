class Contract < ApplicationRecord
  belongs_to :request
  belongs_to :coordinator

  enum approval: { pending: 0, concluded: 1, failure: 2 }
  enum status: { open: 1, close: 2 }
end
