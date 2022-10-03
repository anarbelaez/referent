class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :payment, default: 0, null: false
      t.integer :delivery, default: 0, null: false
      t.boolean :status, default: true, null: false

      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
