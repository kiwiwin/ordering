class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		render :nothing => true
	end
end