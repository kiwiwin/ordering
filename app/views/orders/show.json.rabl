object @order

attributes :id, :price

node(:uri) { |order| user_order_url order.user, order }
node(:user_uri) { |order| user_url order.user }
node(:product_uri) { |order| product_url order.product }