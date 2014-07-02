require 'rails_helper'

RSpec.describe Order, :type => :model do
	fixtures :all

	describe 'price' do
		it 'is the product price' do
			order = orders(:apple_juice_order)
			expect(order.price).to eq(10.12)
		end
	end
end
