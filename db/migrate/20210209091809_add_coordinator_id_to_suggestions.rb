class AddCoordinatorIdToSuggestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :suggestions, :coordinator, foreign_key: true
  end
end
