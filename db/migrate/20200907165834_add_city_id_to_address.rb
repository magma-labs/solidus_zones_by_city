class AddCityIdToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_addresses, :city_id, :integer
    if defined? ::StrongMigrations
      safety_assured { remove_column :spree_addresses, :city, :string }
    else
      remove_column :spree_addresses, :city, :string
    end
  end
end
