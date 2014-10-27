class OrdersController < ApplicationController

	def index
		@products = current_user.products
		@orders = Order.all
	end

	def new
		@product = Product.find(params[:product_id])
		@order = @product.orders.new
		@quantity = params[:quantity]
		@total = @product.price.to_i * @quantity.to_i
	end

	def create
		# raise params.inspect
		@product = Product.find(params[:order][:product_id])
		@order = @product.orders.new(order_params)
		if @order.save
			OrderMailer.order_placed(@order).deliver
			@product.available_quantity = @product.available_quantity - @order.product_quantity.to_i
			@product.save
			if @product.available_quantity == 0
				OrderMailer.availablity_zero(@product.user,@product).deliver
			end	
			redirect_to order_path(@order.id)
		else
			render :new
		end
	end

	def show
		@order = Order.find(params[:id])
	end

	protected

	def order_params
		params.require(:order).permit(:email, :first_name, :last_name, :street, :city, :country, :zip, :product_name,
						 :product_price, :product_quantity, :total_amount, :user_id, :product_id)
	end
end