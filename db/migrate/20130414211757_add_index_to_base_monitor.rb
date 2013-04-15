class AddIndexToBaseMonitor < ActiveRecord::Migration
  def change
    add_index :base_monitors, [:monitorable_id, :monitorable_type]
  end
end
