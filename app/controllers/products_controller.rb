class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			flash[:success] = "New product created"
			redirect_to products_path
		else
			flash[:error] = "Product could not be saved"
			render action: :new
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update_attributes(product_params)
			flash[:success] = "Product updated"
			redirect_to products_path
		else
			flash[:error] = "Product could not be updated"
			render action: :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])

		if @product.destroy
			flash[:success] = "Product deleted"
		else
			flash[:error] = "Product could not be deleted"
		end

		redirect_to products_path
	end

	private
		def product_params
			params.require(:product).permit(:name, :description, :price, :photo)
		end
end