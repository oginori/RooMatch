class Favorite < ApplicationRecord
    belongs_to :resident
    belongs_to :interior
end
