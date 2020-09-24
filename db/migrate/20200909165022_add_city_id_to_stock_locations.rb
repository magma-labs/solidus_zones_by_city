class AddCityIdToStockLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_stock_locations, :city_id, :integer, index: true
    if defined? ::StrongMigrations
      safety_assured { remove_column :spree_stock_locations, :city, :string }
    else
      remove_column :spree_stock_locations, :city, :string
    end
  end
end
