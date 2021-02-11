class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :room, foreign_key: true
      t.boolean :is_resident
      t.text :content

      t.timestamps
    end
  end
end
