class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :parlor_id, foreign_key: true
      t.string :name, null: false
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :prefecture_code, default: nil
      t.integer :country_code, default: 81
      t.integer :zipcode
      t.string :telephone

      t.timestamps
    end
  end
end
