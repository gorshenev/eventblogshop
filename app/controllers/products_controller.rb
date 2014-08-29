class ProductsController < ApplicationController
	before_filter :get_product, :only => [:show, :edit, :update, :destroy]
	before_filter :get_upcoming_event, :get_latest_post, :only => [:index, :show]

	def index
		@products = Product.all
	end

	def show
		
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

	end

	def update
		if @product.update_attributes(product_params)
			flash[:success] = "Product updated"
			redirect_to products_path
		else
			flash[:error] = "Product could not be updated"
			render action: :edit
		end
	end

	def destroy
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

		def get_product
			@product = Product.find(params[:id])
		end

		def get_latest_post
			@latest_post = Post.all.order(created_at: :desc).first
		end

		def get_upcoming_event
			@upcoming_event = Event.all.order(time: :asc).first
		end
end