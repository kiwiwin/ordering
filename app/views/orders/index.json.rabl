collection @orders

attributes :price

node(:user_uri) { |order| user_url order.user }
node(:product_uri) { |order| product_url order.product }