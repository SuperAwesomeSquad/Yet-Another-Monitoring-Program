class ChangeEndAndStartToAlertEndAndAlertStart < ActiveRecord::Migration
  def change
    change_table :alerts do |t|
      remove_column :alerts, :end
      remove_column :alerts, :start
      t.datetime :alert_start
      t.datetime :alert_end
    end
  end

end
