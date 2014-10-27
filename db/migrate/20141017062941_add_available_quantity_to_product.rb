class AddAvailableQuantityToProduct < ActiveRecord::Migration
  def change
    add_column :products, :available_quantity, :integer, default: 0
  end
end
