class CreatePingResults < ActiveRecord::Migration
  def change
    create_table :ping_results do |t|
      t.boolean :successful
      t.float :duration
      t.integer :ping_monitor_id

      t.timestamps
    end
  end
end
