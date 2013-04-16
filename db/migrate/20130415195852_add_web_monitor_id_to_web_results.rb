class AddWebMonitorIdToWebResults < ActiveRecord::Migration
  def change
    add_column :web_results, :web_monitor_id, :string
  end
end
