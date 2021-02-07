class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :resident_id
      t.integer :interior_id

      t.timestamps
    end
  end
end
