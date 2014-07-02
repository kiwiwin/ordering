class ProductsController < ApplicationController
	def index
		@products = ["productA", "productB"]
	end
end