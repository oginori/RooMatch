class RemoveColumnFromContracts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contracts, :approval
  end
end
