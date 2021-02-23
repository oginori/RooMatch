class ChangeColumnsToLimitNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :interiors, :budget, false, 0
    change_column :interiors, :budget, :integer, default: 0
    change_column_null :interiors, :description, false, 0
    change_column :interiors, :description, :text, default: '記載なし'
    change_column_null :requests, :budget, false, 0
    change_column :requests, :budget, :integer, default: 0
    change_column_null :suggestions, :budget, false, 0
    change_column :suggestions, :budget, :integer, default: 0
  end

  def down
    change_column_null :interiors, :budget, true, nil
    change_column :interiors, :budget, :integer, default: nil
    change_column_null :interiors, :description, true, nil
    change_column :interiors, :description, :text, default: nil
    change_column_null :requests, :budget, true, nil
    change_column :requests, :budget, :integer, default: nil
    change_column_null :suggestions, :budget, true, nil
    change_column :suggestions, :budget, :integer, default: nil
  end
end
