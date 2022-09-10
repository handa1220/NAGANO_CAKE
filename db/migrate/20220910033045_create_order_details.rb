class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :oeder_id, null: false
      t.integer :item_id, null: false
      t.integer :price_at_status, nul: false
      t.integer :amount, null: false
      t.integer :production_status, null: false, default: 0

      t.timestamps
    end
  end
end
