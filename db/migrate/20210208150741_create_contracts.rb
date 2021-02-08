class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.integer :approval, null: false, default: 0
      t.integer :status
      t.references :request, foreign_key: true
      t.references :coordinator, foreign_key: true

      t.timestamps
    end
  end
end
