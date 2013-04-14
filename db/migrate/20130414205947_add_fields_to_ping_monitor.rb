class AddFieldsToPingMonitor < ActiveRecord::Migration
  def change
    add_column :ping_monitors, :hostname, :string
  end
end
