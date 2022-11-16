class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :quantity
      t.decimal :total
      t.belongs_to :cart
      t.string :details

      t.timestamps
    end
  end
end
