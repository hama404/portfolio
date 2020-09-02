class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :assets do |t|
      t.string :assetable_type, index: true
      t.integer :assetable_id, index: true
      t.attachment :photo

      t.timestamps
    end
  end
end
