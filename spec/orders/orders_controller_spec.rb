describe OrdersController, :type => :controller do
	render_views

	fixtures :all

	describe 'GET Orders of user' do
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
end