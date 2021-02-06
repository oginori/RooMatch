class CreateInteriors < ActiveRecord::Migration[5.2]
  def change
    create_table :interiors do |t|
      t.string :design_img, null: false
      t.date :date_of_creation, null: false
      t.integer :budget
      t.text :description
      t.references :coordinator, foreign_key: true

      t.timestamps
    end
  end
end
