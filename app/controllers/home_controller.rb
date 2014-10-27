class HomeController < ApplicationController

	def index
		@categories = Category.all
		@brands = Brand.all
		@products = Product.order("name").page(params[:page]).per(6)
	end

	def product_store
		@products = Product.order("name").page(params[:page]).per(6)
	end

	def product_category
		# raise params.inspect
		@categories = Category.all
		@brands = Brand.all
		if params[:filter].present?
			if params[:filter].include? "-"
				@products = Product.where("price >= ? AND price <= ?", params[:filter].partition("-").first.to_f ,
										 params[:filter].partition("-").last.to_f ).page(params[:page]).per(6)
			else
				@products = Product.where("price >= ?", params[:filter].to_f ).page(params[:page]).per(6)
			end

		elsif params[:categories].present?
			id = params[:categories]
			@category = Category.find(id).first
			# raise @category.inspect
			@products = @category.products.page(params[:page]).per(6)

		elsif params[:brands].present?			
			id = params[:brands]
			@brand = Brand.find(id).first
			@products = @brand.products.page(params[:page]).per(6)
		elsif	
			if params[:sort].present?
			@products = Product.order("#{params[:sort]} DESC").page(params[:page]).per(6)
			else
			@products = Product.order("price DESC").page(params[:page]).per(6)
			end
		else
			@products = Product.all.page(params[:page]).per(6)
		end
	end

end
