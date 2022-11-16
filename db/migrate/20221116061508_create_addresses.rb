class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.integer :postal_code
      t.string :country
      t.string :city
      t.integer :phone
      t.integer :email

      t.timestamps
    end
  end
end
