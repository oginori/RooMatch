class Favorite < ApplicationRecord
    belongs_to :resident
    belongs_to :interior

    validates_uniqueness_of :interior_id, scope: :resident_id
end
