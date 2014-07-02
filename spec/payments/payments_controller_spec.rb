require 'rails_helper'

describe PaymentsController, :type => :controller do
	render_views

	fixtures :all

	describe 'GET payment of order' do
		before {
			get :show, {:user_id => 1, :order_id => 1, :format => :json}
		}

		it 'have http status 200' do
			expect(response).to have_http_status(200)
		end

		it 'is JSON formatted' do
			payment = JSON.parse(response.body)
			
			expect(payment['uri']).to end_with('/users/1/orders/1/payment')
		end
	end
end