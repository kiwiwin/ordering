class PaymentsController < ApplicationController
	def show
		@user = User.find(params[:user_id].to_i)
		@order = Order.where(id: params[:order_id].to_i).first
		@payment = @order.payment
	end
end