class CreateRacePackages < ActiveRecord::Migration
  def change
    create_table :race_packages do |t|
      t.string :race_id
      t.decimal :price, precision: 2
      t.decimal :discounted_price, precision: 2
      t.integer :quantity
      t.text :description
      t.integer :early_bird_quota
      t.integer :quantity_sold

      t.timestamps null: false
    end
  end
end
