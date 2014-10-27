class AddMainImageToProductImages < ActiveRecord::Migration
  def change
    add_column :product_images, :main_image, :boolean, default: false
  end
end
