class OrdersController < ApplicationController
	before_action :set_user

	def index
		@orders = @user.orders
	end

	def show
		@order = @user.orders.where(id: params[:id].to_i).first
	end

	protected
		def set_user
			@user = User.find(params[:user_id].to_i)
		end
end