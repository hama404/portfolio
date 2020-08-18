class CreateCrowdeds < ActiveRecord::Migration[5.2]
  def change
    create_table :crowdeds do |t|
      t.references :business_hour, foreign_key: true
      t.time :hourly_time
      t.integer :percent

      t.timestamps
    end
  end
end
