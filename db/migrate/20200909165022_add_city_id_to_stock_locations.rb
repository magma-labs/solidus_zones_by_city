class AddCityIdToStockLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_stock_locations, :city_id, :integer
    if StrongMigrations
      safety_assured { remove_column :spree_stock_locations, :city, :string }
    else
      remove_column :spree_stock_locations, :city, :string
    end
  end
end
