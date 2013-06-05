class AddLastCheckedToBaseMonitor < ActiveRecord::Migration
  def change
    add_column :base_monitors, :last_checked, :datetime
    add_column :base_monitors, :initial_check, :boolean, :default => true
  end
end
