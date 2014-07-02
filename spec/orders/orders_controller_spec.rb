describe OrdersController, :type => :controller do
	describe 'GET Orders of user' do
		before {
			get :index, {:user_id => 1}
		}

		it 'have http status 200' do
			expect(response).to have_http_status(200)
		end
	end
end