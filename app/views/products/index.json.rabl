collection @products

attributes :id, :name, :description

node :uri do |product|
	product_url product
end