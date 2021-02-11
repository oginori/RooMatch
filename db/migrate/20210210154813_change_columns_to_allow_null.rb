class ChangeColumnsToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :interiors, :design_img, :text, null: true
    change_column :requests, :room_img, :text, null: true
    change_column :suggestions, :design_img, :text, null: true
  end

  def down
    change_column :interiors, :design_img, :text, null: false
    change_column :requests, :room_img, :text, null: false
    change_column :suggestions, :design_img, :text, null: false
  end
end
