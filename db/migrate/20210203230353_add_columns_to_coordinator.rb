class AddColumnsToCoordinator < ActiveRecord::Migration[5.2]
  def change
    add_column :coordinators, :name, :string, null: false
    add_column :coordinators, :user_name, :string, null: false
    add_column :coordinators, :sex, :integer, null: false
    add_column :coordinators, :birthday, :date, null: false
    add_column :coordinators, :occupation, :string, null: false
  end
end
