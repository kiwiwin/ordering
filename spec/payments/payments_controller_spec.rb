require 'rails_helper'

describe PaymentsController, :type => :controller do
	render_views

	fixtures :all

	describe 'GET payment of order' do
		context 'when order already pay' do
			before {
				get :show, {:user_id => 1, :order_id => 1, :format => :json}
			}

			it 'have http status 200' do
				expect(response).to have_http_status(200)
			end

			it 'is JSON formatted' do
				payment = JSON.parse(response.body)

				expect(payment['uri']).to end_with('/users/1/orders/1/payment')
				expect(payment['amount']).to eq("10.12")
			end
		end

		context 'when order has not pay' do
			before {
				get :show, {:user_id => 1, :order_id => 2, :format => :json}
			}

			it 'have http status 404' do
				expect(response).to have_http_status(404)
			end
		end
	end
end