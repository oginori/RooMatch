class Contract < ApplicationRecord
  belongs_to :request
  belongs_to :coordinator
end
