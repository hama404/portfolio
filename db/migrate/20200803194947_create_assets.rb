class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :imageable_type, index: true
      t.integer :imageable_id, index: true
      t.attachment :photo

      t.timestamps
    end
  end
end
