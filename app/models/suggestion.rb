class Suggestion < ApplicationRecord
  belongs_to :contract
  belongs_to :coordinator
end
