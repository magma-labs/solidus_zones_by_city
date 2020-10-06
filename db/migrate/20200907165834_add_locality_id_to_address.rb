class AddLocalityIdToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_addresses, :locality_id, :integer
  end
end
