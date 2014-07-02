class Payment < ActiveRecord::Base
	belongs_to :order

	def amount
		order.price
	end
end
