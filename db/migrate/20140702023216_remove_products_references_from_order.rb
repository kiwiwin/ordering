class RemoveProductsReferencesFromOrder < ActiveRecord::Migration
  def change
    remove_reference :orders, :products, index: true
  end
end
