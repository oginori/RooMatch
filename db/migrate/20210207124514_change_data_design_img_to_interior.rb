class ChangeDataDesignImgToInterior < ActiveRecord::Migration[5.2]
  def change
    change_column :interiors, :design_img, :text
  end
end
