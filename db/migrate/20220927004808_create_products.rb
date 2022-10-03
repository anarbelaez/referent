class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, null: false
      t.integer :size, default: 3, null: false
      t.integer :color, default: 0
      t.integer :category, default: 0
      t.integer :genre, default: 2
      t.boolean :status, default: true, null: false

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
