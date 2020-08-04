class CreateParlors < ActiveRecord::Migration[5.2]
  def change
    create_table :parlors do |t|
      t.string :name
      t.references :category
      ## infomation
      t.string :url
      t.integer :stores, default: "0"

      ## assets => carrierwave
      ## adress => jp_pref

      ## business hours
      ## crowded situation

      t.timestamps
    end
  end
end
