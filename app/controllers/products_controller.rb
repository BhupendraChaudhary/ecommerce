class ProductsController < ApplicationController

	before_filter :authenticate_user!

	skip_before_filter :authenticate_user!, only: [:product_description]

	def index
		@products = current_user.products.all
	end

	def show
		@product = current_user.products.find(params[:id])
	end

	def new
		@product = current_user.products.new
		@categories = Category.all
		@brands = Brand.all
	end

	def create
		# raise params.inspect
		@product = current_user.products.new(product_params)
		if @product.save
			if params[:image].present?
				params[:image].each do |image|
					ProductImage.create(image: image, product_id: @product.id)
				end
			end
			@product.available_quantity = @product.quantity.to_i
			@product.save
			redirect_to product_path(@product.id)
		else
			render :new
		end	
	end

	def edit
		@product = current_user.products.find(params[:id])
		@categories = Category.all
		@brands = Brand.all
	end

	def update
		@product = current_user.products.find(params[:id])
		if @product.update_attributes(product_params)
			if params[:image].present?
				params[:image].each do |image|
					ProductImage.create(image: image, product_id: @product.id)
				end
			end
			@product.available_quantity = @product.quantity.to_i + @product.available_quantity
			@product.save
			redirect_to product_path(@product.id)
		else
			render :edit
		end
	end

	def destroy
		@product = current_user.products.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

	def create_main_image
		@product = Product.find(params[:id])
		
		if params[:main_image].present?
			if @product.product_images.where(main_image: true).first.present?
				@product_image = @product.product_images.where(main_image: true).first
				@product_image.update_attributes(main_image: false)
			end

			@product_image = @product.product_images.find(params[:main_image])
			@product_image.main_image = true
			@product_image.save
		end
		redirect_to products_path

	end

	def destroy_image
		@image = ProductImage.find(params[:id])
		@image.destroy
		redirect_to edit_product_path(@image.product.id)
	end	

	def product_description
		@product = Product.find(params[:id])
	end
	
	
	protected

	def product_params
		params.require(:product).permit(:name, :price,:quantity, :description, :category_id, :brand_id)
	end

end