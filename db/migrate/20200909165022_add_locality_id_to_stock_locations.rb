class AddLocalityIdToStockLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_stock_locations, :locality_id, :integer
    add_index :spree_stock_locations, :locality_id
  end
end
