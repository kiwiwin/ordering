require 'rails_helper'

describe ProductsController, :type => :controller do
   render_views

   fixtures :products

   describe 'GET products' do
      before {
         get :index, {:format => :json}
      }

      it 'have http status 200' do
         expect(response).to have_http_status(200)
      end

      it 'is JSON formatted' do
      	products = JSON.parse(response.body)

      	expect(products.size).to eq(2)

      	expect(products[0]['name']).to eq('apple juice')
      	expect(products[1]['name']).to eq('banana juice')
      end
   end
end