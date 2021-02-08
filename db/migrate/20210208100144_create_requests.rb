class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :room_size, null: false
      t.text :room_img, null: false
      t.integer :budget
      t.date :deadline, null: false
      t.text :remarks, null: false
      t.references :resident, foreign_key: true
      t.references :coordinator, foreign_key: true, null: true

      t.timestamps
    end
  end
end
