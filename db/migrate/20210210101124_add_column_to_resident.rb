class AddColumnToResident < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :profile_img, :text
  end
end
