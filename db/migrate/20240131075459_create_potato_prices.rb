class CreatePotatoPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :potato_prices do |t|
      t.decimal :amount, precision: 6, scale: 2, null: false
      t.datetime :price_at, null: false

      t.timestamps
    end
  end
end
