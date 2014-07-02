require 'rails_helper'

describe ProductsController, :type => :controller do
   describe 'products controller' do
      it 'get index of products' do
         get :index
         expect(response).to have_http_status(200)
      end
   end
end