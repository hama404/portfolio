class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.references :imageable, polymorphic: true
      t.attachment :photo

      t.timestamps
    end
  end
end
