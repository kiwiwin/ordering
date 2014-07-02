class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	has_one :payment

	def price
		product.price
	end
end
