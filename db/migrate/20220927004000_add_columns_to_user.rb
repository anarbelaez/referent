class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :integer, null: false, default: 2
    add_column :users, :brand, :string
    add_column :users, :description, :text
  end
end
