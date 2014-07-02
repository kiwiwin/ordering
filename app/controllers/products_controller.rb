class ProductsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :product_not_found

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id].to_i)
	end

	protected
		def product_not_found
			render nothing: true, status: :not_found
		end
end