require 'rails_helper'

describe PaymentsController, :type => :controller do
   describe 'GET payment of order' do
   	  before {
         get :show, {:user_id => 1, :order_id => 1}
      }

      it 'have http status 200' do
         expect(response).to have_http_status(200)
      end
   end
end