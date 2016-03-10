class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :purchase_type
      t.integer :quantity_purchased
      t.decimal :cost_of_purchase, precision: 2

      t.timestamps null: false
    end
  end
end
