class CreatePingMonitors < ActiveRecord::Migration
  def change
    create_table :ping_monitors do |t|

      t.timestamps
    end
  end
end
