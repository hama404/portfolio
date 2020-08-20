class CreateCrowdeds < ActiveRecord::Migration[5.2]
  def change
    create_table :crowdeds do |t|
      t.integer :business_hour_id, foreign_key: true
      t.float :hourly_time
      t.integer :percent

      t.timestamps
    end
  end
end
