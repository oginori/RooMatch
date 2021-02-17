class AddRequestIdToSuggestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :suggestions, :request, foreign_key: true
  end
end
