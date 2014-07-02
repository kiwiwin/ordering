describe OrdersController, :type => :controller do
	render_views

	fixtures :all

	describe 'GET orders of user' do
		before {
			get :index, {:user_id => 1, :format => :json}
		}

		it 'have http status 200' do
			expect(response).to have_http_status(200)
		end

		it 'is JSON formatted' do
			orders = JSON.parse(response.body)
			expect(orders.size).to eq(1)

			expect(orders[0]['user_uri']).to end_with("/users/1")
			expect(orders[0]['product_uri']).to end_with("/products/1")
			expect(orders[0]['price']).to eq("10.12")
		end
	end

	describe 'GET an order of user' do
		context 'order is exist' do
			before {
				get :show, {:user_id => 1, :id => 1, :format => :json}
			}

			it 'have http status 200' do
				expect(response).to have_http_status(200)
			end

			it 'is JSON formatted' do
				order = JSON.parse(response.body)

				expect(order['user_uri']).to end_with("/users/1")
				expect(order['product_uri']).to end_with("/products/1")
				expect(order['price']).to eq("10.12")
			end
		end

		context 'order is not exist' do
			before {
				get :show, {:user_id => 1, :id => 10000, :format => :json}
			}

			it 'have http status 404' do
				expect(response).to have_http_status(404)
			end
		end
	end

	describe 'POST an order' do
		context 'order is valid' do
			before {
				post :create, {:user_id => 1, :order => {:product_id => 2}}
			}

			it 'have http status 201' do
				expect(response).to have_http_status(201)
			end
		end
	end
end