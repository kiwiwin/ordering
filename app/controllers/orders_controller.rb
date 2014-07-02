class OrdersController < ApplicationController
	def index
		@orders = User.find(params[:user_id].to_i).orders
	end
end