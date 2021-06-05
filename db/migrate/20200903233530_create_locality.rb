# frozen_string_literal: true

class CreateLocality < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_localities do |t|
      t.integer :state_id, index: true
      t.string :name
      t.timestamps
    end
  end
end
