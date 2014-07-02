require 'rails_helper'

describe ProductsController, :type => :controller do
   render_views

   fixtures :products

   describe 'GET products' do
      before {
         get :index, format: :json
      }

      it 'have http status 200' do
         expect(response).to have_http_status(200)
      end

      it 'is JSON formatted' do
      	products = JSON.parse(response.body)

      	expect(products.size).to eq(2)

      	expect(products[0]['id']).to eq(1)
      	expect(products[1]['id']).to eq(2)

      	expect(products[0]['name']).to eq('apple juice')
      	expect(products[1]['name']).to eq('banana juice')

         expect(products[0]['description']).to eq('good')   	
         expect(products[1]['description']).to eq('just so so')   	

         expect(products[0]['uri']).to end_with('/products/1')
         expect(products[1]['uri']).to end_with('/products/2')   	
      end
   end

   describe 'GET one product' do
   	context 'when product is exist' do
   	   before {
   		   get :show, id: 1, format: :json
   	   }

   	   it 'have http status 200' do
   		   expect(response).to have_http_status(200)
   	   end

   	   it 'is JSON formatted' do
   		   product = JSON.parse(response.body)

   		   expect(product['id']).to eq(1)
   		   expect(product['name']).to eq('apple juice')
   		   expect(product['description']).to eq('good')   	
   		   expect(product['uri']).to end_with('/products/1')
   	   end
      end

      context 'when product is not exist' do
      	before {
      		get :show, id: 10000, format: :json
      	}

      	it 'have http status 404' do
      		expect(response).to have_http_status(404)
      	end
      end
   end
end