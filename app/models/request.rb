class Request < ApplicationRecord
  belongs_to :resident
  belongs_to :coordinator
end
