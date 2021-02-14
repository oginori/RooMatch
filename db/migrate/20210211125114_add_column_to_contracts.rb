class AddColumnToContracts < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :approval, :boolean, default: false, after: :status
  end
end
