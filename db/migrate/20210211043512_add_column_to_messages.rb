class AddColumnToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :sender_id, :integer, null: false
  end
end
