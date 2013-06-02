class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :duration
      t.datetime :start
      t.datetime :end
      t.boolean :active
      t.string :resolution
      t.integer :base_monitor_id
      t.datetime :last_check

      t.timestamps
    end
    add_index :alerts, :active
    add_index :alerts, :base_monitor_id
  end
end
