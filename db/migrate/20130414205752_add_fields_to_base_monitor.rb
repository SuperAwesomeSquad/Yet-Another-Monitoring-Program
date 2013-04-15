class AddFieldsToBaseMonitor < ActiveRecord::Migration
  def change
    add_column :base_monitors, :frequency_in_seconds, :integer, default: 300
    add_column :base_monitors, :active, :boolean, default: true
  end
end
