class OrdersController < ApplicationController
	before_action :set_user

	def index
		@orders = @user.orders
	end

	def show
		@order = @user.orders.where(id: params[:id].to_i).first
		render :nothing => true, :status => :not_found unless @order
	end

	def create
		@order = @user.orders.build(product_id: order_params[:product_id].to_i)
		@order.save
		render :nothing => true, :status => :created, :location => user_order_url(@user, @order)
	end

	protected
		def set_user
			@user = User.find(params[:user_id].to_i)
		end

		def order_params
			params[:order]
		end
end