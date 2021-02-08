class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.text :design_img, null:false
      t.text :description, null:false
      t.integer :budget
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
