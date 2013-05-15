class MakeActiveTrueDefaultOnAlerts < ActiveRecord::Migration
  def change
    change_column :alerts, :active, :boolean, :default => true
  end
end
