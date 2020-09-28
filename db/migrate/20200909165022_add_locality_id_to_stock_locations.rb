class AddLocalityIdToStockLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_stock_locations, :locality_id, :integer, index: true
  end
end
