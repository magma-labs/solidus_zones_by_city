class AddCityIdToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_addresses, :city_id, :integer
    if StrongMigrations
      safety_assured { remove_column :spree_addresses, :city, :string }
    else
      remove_column :spree_addresses, :city, :string
    end
  end
end
