class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.references :parlor, foreign_key: true
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :prefecture_code, default: nil
      t.integer :country_code, default: "81"
      t.integer :zipcode
      t.integer :telephone

      t.timestamps
    end
  end
end
