class CreateBusinessHours < ActiveRecord::Migration[5.0]
  def change
    create_table :business_hours do |t|
      t.integer :adress_id, foreign_key: true
      t.integer :wday
      t.float :open
      t.float :close
      t.float :last_order

      t.timestamps
    end
  end
end
