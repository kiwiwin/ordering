class OrdersController < ApplicationController
	def index
		@orders = User.find(params[:user_id].to_i).orders
	end

	def show
		@order = User.find(params[:user_id].to_i).orders.where(id: params[:id].to_i).first
	end
end