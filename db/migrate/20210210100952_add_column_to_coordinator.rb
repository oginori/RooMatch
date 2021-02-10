class AddColumnToCoordinator < ActiveRecord::Migration[5.2]
  def change
    add_column :coordinators, :profile_img, :text
  end
end
