class CreateInfomations < ActiveRecord::Migration[5.2]
  def change
    create_table :infomations do |t|
      t.string :infoable_type, index: true
      t.integer :infoable_id, index: true
      t.text :notice

      t.timestamps
    end
  end
end
