class PaymentsController < ApplicationController
	before_action :set_order

	def show
		@payment = @order.payment
		render nothing: true, status: :not_found unless @payment
	end

	def create
		if !@order.payment
			@payment = @order.build_payment()
			@payment.save
			render nothing: true, status: :created, location: user_order_payment_url(@user, @order)
		else
			render nothing: true, status: :bad_request
		end
	end

	protected
		def set_order
			@user = User.find(params[:user_id].to_i)
			@order = Order.where(id: params[:order_id].to_i).first
		end
end