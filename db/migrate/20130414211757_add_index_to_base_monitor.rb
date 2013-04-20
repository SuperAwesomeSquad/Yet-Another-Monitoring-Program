class AddIndexToBaseMonitor < ActiveRecord::Migration
  def change
    add_index :base_monitors, [:frequency_in_seconds]
  end
end
