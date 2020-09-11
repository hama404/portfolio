class CreateParlors < ActiveRecord::Migration[5.0]
  def change
    create_table :parlors do |t|
      t.string :name, null: false
      t.integer :category_id, foreign_key: true
      ## infomation
      t.string :url
      t.string :insta
      t.integer :stores, default: 0

      t.timestamps
    end
  end
end
