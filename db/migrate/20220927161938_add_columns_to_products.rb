class AddColumnsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :size, :string, null: false
    add_column :products, :color, :string, null: false
    add_column :products, :category, :string, null: false
    add_column :products, :genre, :string, null: false
  end
end
