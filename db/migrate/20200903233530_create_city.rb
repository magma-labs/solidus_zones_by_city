class CreateCity < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_cities do |t|
      t.integer :state_id, index: true
      t.string :name
    end
  end
end
