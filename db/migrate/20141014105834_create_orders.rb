class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :country
      t.integer :zip
      t.string :product_name
      t.string :product_price
      t.string :product_quantity
      t.string :total_amount
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
