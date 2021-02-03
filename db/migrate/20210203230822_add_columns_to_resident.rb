class AddColumnsToResident < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :name, :string, null: false
    add_column :residents, :user_name, :string, null: false
    add_column :residents, :sex, :integer, null: false
    add_column :residents, :birthday, :date, null: false
  end
end
