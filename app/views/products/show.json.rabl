object @product

attributes :id, :name, :description

node(:uri) { |product| product_url product }