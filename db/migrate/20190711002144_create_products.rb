class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_title
      t.text :product_body
      t.integer :product_price
      t.timestamps
    end
  end
end
