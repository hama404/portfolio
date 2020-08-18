class CreateBusinessHours < ActiveRecord::Migration[5.2]
  def change
    create_table :business_hours do |t|
      t.references :parlor, foreign_key: true
      t.string :day
      t.time :open
      t.time :close
      t.time :last_order
      t.integer :open_crowded
      t.integer :close_crowded

      t.timestamps
    end
  end
end
