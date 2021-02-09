class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :resident, foreign_key: true
      t.references :coordinator, foreign_key: true
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
