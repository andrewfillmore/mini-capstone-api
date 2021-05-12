class AddsTotalCountToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :total_inventory, :integer
  end
end
